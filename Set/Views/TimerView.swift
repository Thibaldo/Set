//
//  TimerView.swift
//  Set
//
//  Created by Pro on 26/04/2022.
//

import SwiftUI

struct TimerView: View {
    @State var countDownTimer = 60
    @State var timerRunning = false
    
    var trigger: () -> ()
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(countDownTimer)")
                .onReceive(timer) { _ in
                    if countDownTimer > 0 && timerRunning {
                        countDownTimer -= 1
                        
                        if countDownTimer == 0 {
                            trigger()
                        }
                    } else {
                        timerRunning = false
                    }
                }
                .font(.system(.subheadline))
        }
    }
}

//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView(trigger: () -> ())
//    }
//}
