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

typealias Dispatcher = (Action) -> Void
typealias Middleware<State: ReduxState> = (State, Action, @escaping Dispatcher) -> Void
