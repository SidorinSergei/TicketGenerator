
enum TaskFilterState { all, theoretical, practical, none }
extension TaskFilterStateExtension on TaskFilterState {

  bool doesInclude(TaskFilterState type) => this == TaskFilterState.all || this == type;

  TaskFilterState updatedWith(TaskFilterState other) {
    switch (this) {
      case TaskFilterState.all:
        return other.opposite();
      case TaskFilterState.none:
        return other;
      default:
        return other == this ? TaskFilterState.none : TaskFilterState.all;
    }
  }

  TaskFilterState opposite() {
    switch (this) {
      case TaskFilterState.theoretical:
        return TaskFilterState.practical;
      case TaskFilterState.practical:
        return TaskFilterState.theoretical;
      default:
        return this;
    }
  }
}