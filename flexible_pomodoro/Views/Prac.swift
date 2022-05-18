//
//  Prac.swift
//  flexible_pomodoro
//
//  Created by taekkim on 2022/05/04.
//

import SwiftUI

struct Prac: View {
    var body: some View {
        Circle()
            .trim(from:0, to:25/30)
            .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35, lineCap: .round))
            .rotationEffect(.init(degrees: -30))
    }
}

struct Prac_Previews: PreviewProvider {
    static var previews: some View {
        Prac()
    }
}
