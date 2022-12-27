//
//  TaskState.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import Foundation

struct Task  {
    let title: String
}

struct TaskState: ReduxState {
    let tasks: [Task]
}
