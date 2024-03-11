import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/todo_cubit.dart';
import 'package:todoapp/todo_state.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(),
      child: MaterialApp(
        title: "Todo Application",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Todo App"),
          ),
          body: BlocBuilder<TodoCubit, TodoState>(
            builder: (context, state) {
              return switch (state) {
                TodoInitialState() => const Center(
                    child: Text("Hi, Let me load content here"),
                  ),
                TodoLoadingState() => const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Loading content..."),
                      ],
                    ),
                  ),
                TodoLoadedState(items: var items) => Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Center(
                          child: Text("Items loaded successfully"),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return Text("${index + 1} - ${items[index]}");
                              }),
                        )
                      ],
                    ),
                  ),
                TodoErrorState(error: var error) => Center(
                    child: Text(error),
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}
