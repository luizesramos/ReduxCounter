//
//  ReduxCounterApp.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import SwiftUI

@main
struct ReduxCounterApp: App {
    let store: Store = .init(reducer: appReducer,
                             state: AppState(),
                             middlewares: [
                                logMiddleware
                             ])
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
            
        }
    }
}
