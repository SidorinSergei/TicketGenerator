
enum TaskType { theoretical, practical, }

class TaskTypeUtils {
  static TaskType fromString(String value) {
    switch (value) {
      case "theoretical":
        return TaskType.theoretical;
      default:
        return TaskType.practical;
    }
  }

  static String toStringValue(TaskType type) {
    switch (type) {
      case TaskType.theoretical:
        return "theoretical";
      default:
        return "practical";
    }
  }
}
