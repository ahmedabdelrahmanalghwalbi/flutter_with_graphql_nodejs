import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_client/bloc/todo_bloc.dart';
import 'package:flutter_todo_client/bloc/todo_events.dart';
import 'package:flutter_todo_client/bloc/todo_states.dart';
import 'package:flutter_todo_client/data/todo_model.dart';

class TodosMainScreen extends StatelessWidget {
  const TodosMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController idController = TextEditingController();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController contentController = TextEditingController();
    final todoProvider = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add new todo'),
                content: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: idController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Id is required';
                            }
                            return null;
                          },
                          decoration:
                              const InputDecoration(hintText: 'Enter todo id'),
                        ),
                        TextFormField(
                          controller: titleController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Title is required';
                            }
                            return null;
                          },
                          decoration:
                              const InputDecoration(hintText: 'Enter title'),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Content is required';
                            }
                            return null;
                          },
                          controller: contentController,
                          decoration:
                              const InputDecoration(hintText: 'Enter content'),
                        ),
                      ],
                    )),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      todoProvider.add(AddTodoEvent(
                          todo: Todo(
                              content: contentController.text,
                              id: idController.text,
                              title: titleController.text,
                              completed: false)));
                      Navigator.of(context).pop();
                      todoProvider.add(GetAllTodos());
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        label: const Row(
          children: [
            Text(
              "Add New Todo",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 4,
            ),
            Icon(
              Icons.add,
              color: Colors.white,
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Todos Main Screen'),
      ),
      body: BlocConsumer<TodoBloc, TodoState>(builder: (context, state) {
        if (state is TodoLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TodoErrorState) {
          return Center(
            child: Text(state.message),
          );
        } else {
          if (state is TodoLoadedState) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(state.todos[index].title),
                    subtitle: Text(
                      state.todos[index].content,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          todoProvider.add(
                              DeleteTodoEvent(todoId: state.todos[index].id));
                          todoProvider.add(GetAllTodos());
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).primaryColor,
                        )),
                  ),
                );
              },
            );
          } else {
            return Text(state.toString());
          }
        }
      }, listener: (context, state) {
        if (state is TodoLoadingState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("lOADING ......."),
          ));
        }
        if (state is TodoLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("LOADED ......."),
          ));
        }
        if (state is TodoErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("ERROR ......."),
          ));
        } else if (state is TodoMutatedState) {
          if (state is TodoLoadingState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Updated Successfully ......."),
            ));
          }
        }
      }),
    );
  }
}
