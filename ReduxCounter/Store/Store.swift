//
//  Store.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import Foundation

final class Store<StoreState: ReduxState>: ObservableObject {
    @Published var state: StoreState
    
    private let reducer: Reducer<StoreState>
    private let middlewares: [Middleware<StoreState>]
    
    init(reducer: @escaping Reducer<StoreState>,
         state: StoreState,
         middlewares: [Middleware<StoreState>]) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }
    
    func dispatch(action: Action) {
        // run reducers first
        Task { @MainActor in
            state = reducer(state, action)
        }
        
        // run all middlewares
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
