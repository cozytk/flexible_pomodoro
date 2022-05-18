//
//  TimerView.swift
//  flexible_pomodoro
//
//  Created by taekkim on 2022/05/04.
//

import SwiftUI
import UserNotifications

struct Home: View {
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var focusTime = 25 * 60
    private let foucsRed = Color(red: 253/255, green: 60/255, blue: 79/255)
    
    var body: some View {
        ZStack{
//            Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
            
            VStack{
            ZStack{
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35, lineCap: .butt))
                    .frame(width: 280, height: 280)
                Circle()
                    .trim(from: 1 - self.to, to: 1)
                    .stroke(self.foucsRed, style: StrokeStyle(lineWidth: 35, lineCap: .butt))
                    .frame(width: 280, height: 280)
                    .rotationEffect(.init(degrees: -90))
                
                VStack {
                    Text("\(self.focusTime / 60):\(self.getStringFrom(seconds: self.focusTime % 60))")
                        .font(.system(size: 65))
                        .fontWeight(.bold)
                        .foregroundColor(self.foucsRed)
                        .shadow(radius: 5)
                }
            }
                HStack(spacing: 20){
                    Button(action: {
                        if self.focusTime == 0 {
                            self.focusTime = 1500
                            withAnimation(.default) {
                                self.to = 1500
                            }
                            MainView.focusState = .focus
                        }
                        self.start.toggle()
                    }) {
                        HStack(spacing: 15){
                            Image(systemName: self.start ? "pause.fill" : "play.fill")
                                .foregroundColor(.white)
                            
                            Text(self.start ? "Pause" : "Play")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(self.foucsRed)
                        .clipShape(Capsule())
                    }
                    Button(action: {
                        self.focusTime = 0
                        
                        withAnimation(.default){
                            self.to = 0
                        }
                    }) {
                        HStack(spacing: 15){
                            Image(systemName:"arrow.clockwise")
                                .foregroundColor(self.foucsRed)
                            
                            Text("Restart")
                                .foregroundColor(self.foucsRed)
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(
                            Capsule().stroke(Color.red, lineWidth: 2)
                        )
                        .shadow(radius: 6)
                    }
                }
                .padding(.top, 55)
            }
             
        }
        .onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound, .alert]) { (_, _) in
            }
        })
        
        .onReceive(self.time) { (_) in
            if self.start{
                if self.focusTime != 0 {
                self.focusTime -= 1
                    print(self.to)
                    withAnimation(.default) {
                        self.to = CGFloat(self.focusTime) / 1500
                    }
                }
                else {
                    self.start.toggle()
                    self.Notify()
                }
            }
        }
    }
    
    func Notify() {
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "Timer is Completed Succesfully In Background !!!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
    
    func getStringFrom(seconds: Int) -> String {

        return seconds < 10 ? "0\(seconds)" : "\(seconds)"
    }
}

struct TimerView: View {
    var body: some View {
        Home()
//        Image("Timer")
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
