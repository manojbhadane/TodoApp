sealed class TodoState {}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<String> items;

  TodoLoadedState(this.items);
}

class TodoErrorState extends TodoState {
  final String error;

  TodoErrorState(this.error);
}
