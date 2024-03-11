import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitialState()) {
    loadData();
  }

  Future<void> loadData() async {
    emit(TodoInitialState());
    await Future.delayed(const Duration(seconds: 2));
    emit(TodoLoadingState());
    await Future.delayed(const Duration(seconds: 4));
    emit(TodoLoadedState([
      "One",
      "Two",
      "Three",
      "Four",
    ]));
  }
}
