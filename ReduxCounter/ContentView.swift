//
//  ContentView.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store<AppState>
    @State var addTaskPresented: Bool = false
    
    struct Props {
        let counter: Int
        let increment: () -> Void
        let decrement: () -> Void
        let addAmount: (Int) -> Void
        let addTask: (TodoTask) -> Void
        
    }
    
    var props: Props {
        map(state: store.state.counterState)
    }
    
    private func map(state: CounterState) -> Props {
        Props(counter: state.counter,
              increment: { store.dispatch(action: IncrementAction()) },
              decrement: { store.dispatch(action: DecrementAction()) },
              addAmount: { store.dispatch(action: AddAction(amount: $0))},
              addTask: { store.dispatch(action: AddTaskAction(task: $0)) }
        )
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(props.counter)")
                .padding()
            Button("Increment") {
                props.increment()
            }
            Button("Decrement") {
                props.decrement()
            }
            Button("Add 100") {
                props.addAmount(100)
            }
            
            Spacer()
            
            Button("Add Task") {
                addTaskPresented = true
            }
            Spacer()
        }
        .sheet(isPresented: $addTaskPresented) { AddTaskView() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
