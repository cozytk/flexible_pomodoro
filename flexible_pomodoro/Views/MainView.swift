//
//  MainView.swift
//  flexible_pomodoro
//
//  Created by taekkim on 2022/04/29.
//

import SwiftUI

//struct MainView: View {
//
//    @State var clickCheck = false
//
//    var body: some View {
//        Button(action: {
//            self.clickCheck.toggle()
//        }){
//            Text("clickCheck?")
//        }
//        if self.clickCheck {
//            Text("is Button Clicked")
//        }
//    }
//}

//
//struct NewView: View {
//    @State private var focusState: FocusState = .focus
//
//    var body: some View {
//        Text("")
//    }
//}

//enum FocusState {
//    case focus, break_, pause
//}

struct MainView: View {
    @State static var focusState: FocusState = .ready
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text(MainView.focusState.rawValue)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink(destination: DashBoardView()) {
                        Image(systemName: "chart.bar")
                    }
                }.padding()
                MainCenterView()
//                HStack {
//                    Button(action: {
//                        focusState = .focus
//                    }
//                    ) {
//                        Text(focusState.rawValue)
//                    }
//                    Button(action: {
//                        focusState = .pause
//                    }
//                    ) {
//                        Text(focusState.rawValue)
//                    }
//                    Button(action: {
//                        focusState = .break_
//                    }
//                    ) {
//                        Text(focusState.rawValue)
//                    }
//                }
                
                //                NavigationLink(
                
            }.navigationBarHidden(true).navigationTitle(MainView.focusState.rawValue)
            //NOTE: navigationBar로 했을떄의 이점이 있나?
            //            }.navigationBarItems(leading: Text(focusState.rawValue), trailing: NavigationLink("lderk", destination: DashBoardView()))
            //            }.navigationBarHidden(true)
            //            }.navigationTitle("Focus")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.portrait)
    }
}
