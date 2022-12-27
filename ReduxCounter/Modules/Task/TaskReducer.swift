//
//  TaskReducer.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import Foundation

func taskReducer(state: TaskState, action: Action) -> TaskState {
    var state = state
    
    switch action {
    case let a as AddTaskAction:
        state.tasks.append(a.task)
    default:
        break // this domain does not handle the requested action
    }
    
    return state
}
