//
//  Reducer.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import Foundation

func counterReducer(state: CounterState, action: Action) -> CounterState {
    var state = state
    
    switch action {
    case is IncrementAction:
        state.counter += 1
    case is DecrementAction:
        state.counter -= 1
    case let a as AddAction:
        state.counter += a.amount
    default:
        break // this domain does not handle the requested action
    }
    
    return state
}
