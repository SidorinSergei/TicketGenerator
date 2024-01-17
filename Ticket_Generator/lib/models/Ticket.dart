
import '../Services/DataService/Entities/TaskDB.dart';

enum TicketType {
  basic, // 3 tasks - 2 theory, 1 practice
  custom, //(theory: Int, practice: Int)
}

class Ticket {
  TicketType type;
  int variant;
  int complexity;
  List<TaskDB> tasks;

  Ticket({
    required this.type,
    required this.variant,
    required this.complexity,
    required this.tasks
  });
}
