//
//  TaskState.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import Foundation

struct TodoTask: Identifiable {
    let id: UUID = .init()
    let title: String
}

struct TaskState: ReduxState {
    // "var" to allow reducer to change the state more easily
    var tasks: [TodoTask] = .init()
}
