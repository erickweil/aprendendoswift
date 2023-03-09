//
//  FundoCarta.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 06/03/23.
//

import SwiftUI


struct Cardify: AnimatableModifier {
    var backColor: Color
    var rotation: Double // 0 - 360
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    init(isFaceUp: Bool, backColor: Color) {
        self.backColor = backColor
        self.rotation = isFaceUp ? 0.0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            // Define o RoundedRectangle na variável 'shape'
            // Assim não precisa repetir toda vez
            let shape = RoundedRectangle(cornerRadius: 15.0)
            
            if rotation > 90.0 {
                    shape.fill().foregroundColor(backColor)
            } else {
                shape.fill()
                    .foregroundColor(.white)
                
                shape.strokeBorder(lineWidth: 5)
                    .foregroundColor(backColor)
                
            }
            
            //if rotation < 90.0 {
            content.opacity(rotation < 90 ? 1 : 0)
            //}
            
        }.rotation3DEffect(
            Angle.degrees(rotation)
            ,axis: (0.0,1.0,0.0))
    }
}

extension View {
    func cardify(isFaceUp: Bool,backColor: Color) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, backColor: backColor))
    }
}

struct Cardify_test: View {
    
    struct TimedCardFlip {
        var isFaceUp = true {
            didSet {
                if isFaceUp {
                    startUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        
        var isMatched = false {
            didSet {
                stopUsingBonusTime()
            }
        }
        var lastFaceUpDate: Date?
        var pastFaceUpTime: TimeInterval = 0
        
        var bonusTimeLimit: TimeInterval = 10
        
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = self.lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }
        
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            self.lastFaceUpDate = nil
        }
    }
    
    class Flipper: ObservableObject {
        
        @Published
        var model: TimedCardFlip
        
        init() {
            self.model = TimedCardFlip()
        }

    }
    
    @ObservedObject
    var test: Flipper
    
    @State
    var animatedBonusRemaining: Double = 0
    
    init(_ test: Flipper) {
        self.test = test
    }
    
    var body: some View {
        ZStack {
            
            if test.model.isConsumingBonusTime {
                ProgressShape(progress: animatedBonusRemaining)
                    .stroke(lineWidth: 15.0)
                    .foregroundColor(Color.blue)
                    .onAppear {
                        animatedBonusRemaining = test.model.bonusRemaining
                        withAnimation(.linear(duration: test.model.bonusTimeRemaining)) {
                            animatedBonusRemaining = 0
                        }
                    }
            }
        
            Text("OK").foregroundColor(Color.blue).padding().font(Font.system(size: 20.0))
        }
        .padding(35.0)
        .cardify(isFaceUp: test.model.isFaceUp, backColor: Color.red)
        .frame(width: 200,height: 200)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.25)) {
                test.model.isFaceUp.toggle()
            }
        }
    }
}

struct FundoCarta_Previews: PreviewProvider {

    static var previews: some View {
        
        Cardify_test(Cardify_test.Flipper())
    }
}
