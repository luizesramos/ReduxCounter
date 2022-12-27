//
//  Reducer.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import Foundation

protocol ReduxState {}

protocol Action {}

typealias Reducer<State: ReduxState> = (State, Action) -> State

final class Store<StoreState: ReduxState>: ObservableObject {
    @Published var state: StoreState
    
    private let reducer: Reducer<StoreState>
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action) {
        state = reducer(state, action)
    }
}
