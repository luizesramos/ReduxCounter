//
//  AppState.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import Foundation

struct AppState: ReduxState {
    var counterState: CounterState = .init()
    var taskState: TaskState = .init()
}
