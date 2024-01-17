// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaskDB.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class TaskDB extends _TaskDB with RealmEntity, RealmObjectBase, RealmObject {
  TaskDB(
    ObjectId id,
    String type,
    int number,
    String description,
    String answer,
    int complexity,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'number', number);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'answer', answer);
    RealmObjectBase.set(this, 'complexity', complexity);
  }

  TaskDB._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  int get number => RealmObjectBase.get<int>(this, 'number') as int;
  @override
  set number(int value) => RealmObjectBase.set(this, 'number', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String get answer => RealmObjectBase.get<String>(this, 'answer') as String;
  @override
  set answer(String value) => RealmObjectBase.set(this, 'answer', value);

  @override
  int get complexity => RealmObjectBase.get<int>(this, 'complexity') as int;
  @override
  set complexity(int value) => RealmObjectBase.set(this, 'complexity', value);

  @override
  Stream<RealmObjectChanges<TaskDB>> get changes =>
      RealmObjectBase.getChanges<TaskDB>(this);

  @override
  TaskDB freeze() => RealmObjectBase.freezeObject<TaskDB>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TaskDB._);
    return const SchemaObject(ObjectType.realmObject, TaskDB, 'TaskDB', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('number', RealmPropertyType.int),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('answer', RealmPropertyType.string),
      SchemaProperty('complexity', RealmPropertyType.int),
    ]);
  }
}
