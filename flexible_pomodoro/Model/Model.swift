//
//  Model.swift
//  flexible_pomodoro
//
//  Created by taekkim on 2022/04/30.
//

import Foundation

//class AppInfo: ObservableObject {
//    @Published var focusState: FocusState = .ready
//}

enum FocusState: String {
    case ready = "Ready"
    case focus = "Foucs"
    case break_ = "Break"
    case pause = "Pause"
}
