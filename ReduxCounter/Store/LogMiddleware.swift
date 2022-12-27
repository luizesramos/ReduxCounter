//
//  LogMiddleware.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import Foundation

func logMiddleware(state: AppState, action: Action, dispatcher: @escaping Dispatcher) {
    debugPrint("[LOGGER] \(action)")
}
