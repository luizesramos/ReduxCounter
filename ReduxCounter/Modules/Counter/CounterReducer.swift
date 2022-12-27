//
//  Reducer.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import Foundation

func counterReducer(state: CounterState, action: Action) -> CounterState {
    var state = state
    
    if action is IncrementAction {
        state.counter += 1
    } else if action is DecrementAction {
        state.counter -= 1
    } else if let a = action as? AddAction {
        state.counter += a.amount
    } else {
        debugPrint("Action not implemented \(action)")
    }
    
    return state
}
