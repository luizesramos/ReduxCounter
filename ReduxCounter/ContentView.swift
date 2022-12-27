//
//  ContentView.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        let counter: Int
        let increment: () -> Void
        let decrement: () -> Void
        let add100: () -> Void
    }
    
    var props: Props {
        map(state: store.state.counterState)
    }
    
    private func map(state: CounterState) -> Props {
        Props(counter: state.counter,
              increment: { store.dispatch(action: IncrementAction()) },
              decrement: { store.dispatch(action: DecrementAction()) },
              add100: { store.dispatch(action: AddAction(amount: 100))} )
    }
    
    var body: some View {
        VStack {
            Text("\(props.counter)")
                .padding()
            Button("Increment") {
                props.increment()
            }
            Button("Decrement") {
                props.decrement()
            }
            Button("Add 100") {
                props.add100()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
