//
//  CounterActions.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import Foundation

struct IncrementAction: Action {}
struct DecrementAction: Action {}
struct AddAction: Action {
    let amount: Int
}
