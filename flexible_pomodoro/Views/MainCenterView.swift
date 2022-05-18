//
//  NewView.swift
//  flexible_pomodoro
//
//  Created by taekkim on 2022/05/03.
//

import SwiftUI

struct MainCenterView: View {
    var body: some View {
        TabView {
            TimerView()
            TreeView()
        }.tabViewStyle(PageTabViewStyle())
    }
}

//struct MainCenterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainCenterView(focusState: FocusState(rawValue: .focus))
//    }
//}
