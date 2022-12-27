//
//  AppReducer.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import Foundation

func appReducer(state: AppState, action: Action) -> AppState {
    var state = state
    state.counterState = counterReducer(state: state.counterState, action: action)
    return state
}
