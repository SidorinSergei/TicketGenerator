
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:realm/realm.dart';
import 'Entities/TaskDB.dart';

class TaskDBManager {

  final Configuration _config = Configuration.local([TaskDB.schema]);
  late Realm _realm;

  TaskDBManager() {
    open();
  }

  Future<void> open() async {
    _realm = await Realm.open(_config);
  }

  Future<void> close() async {
    if (!_realm.isClosed) {
      _realm.close();
    }
  }

  RealmResults<TaskDB> getAllTasks() {
    return _realm.all<TaskDB>();
  }

  bool addTask(TaskDB task) {
    try {
      _realm.write(() {
        _realm.add(task);
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool updateTask(TaskDB task) {
    try {
      _realm.write(() {
        _realm.add(task, update: true);
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool deleteTask(TaskDB task) {
    try {
      _realm.write(() {
        _realm.delete(task);
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool deleteAll() {
    try {
      _realm.write(() {
        _realm.deleteAll<TaskDB>();
        // _realm.deleteAll();
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }
}
