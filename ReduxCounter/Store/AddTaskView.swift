//
//  AddTaskView.swift
//  ReduxCounter
//
//  Created by Luiz Ramos on 12/27/22.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: Store<AppState>
    @State var taskText: String = ""
    
    struct Props {
        let tasks: [TodoTask]
        let addTask: (TodoTask) -> Void
    }
    
    func map(state: TaskState) -> Props {
        Props(
            tasks: state.tasks,
            addTask: { store.dispatch(action: AddTaskAction(task: $0)) }
        )
    }
    
    var props: Props {
        map(state: store.state.taskState)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Enter task", text: $taskText)
                    
                    Button("Add") {
                        props.addTask(TodoTask(title: taskText))
                    }
                }
                .padding(20)
                
                List(props.tasks) { item in
                    Text(item.title)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
