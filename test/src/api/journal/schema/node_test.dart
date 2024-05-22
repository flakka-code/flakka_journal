import 'package:stash/stash_api.dart';
import 'dart:io';

import 'package:stash_file/stash_file.dart';

class Task {
  Task({required this.id, required this.title, this.completed = false});

  /// Creates a [Task] from json map
  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] as int,
        title: json['title'] as String,
        completed: json['completed'] as bool,
      );
  final int id;
  final String title;
  final bool completed;

  /// Creates a json map from a [Task]
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'title': title, 'completed': completed};

  @override
  String toString() {
    return 'Task $id, "$title" is ${completed ? "completed" : "not completed"}';
  }
}

class Contact {
  Contact({required this.id, required this.name});

  /// Creates a [Contact] from json map
  factory Contact.fromJson(Map<String, dynamic> json) =>
      Contact(id: json['id'] as int, name: json['name'] as String);
  final int id;
  final String name;

  /// Creates a json map from a [Contact]
  Map<String, dynamic> toJson() => <String, dynamic>{'id': id, 'name': name};

  @override
  String toString() {
    return 'Contact $id, "$name"';
  }
}

void main() async {
  // Temporary directory
  final path = Directory.systemTemp.path;

  // Creates a store
  final store = await newFileLocalVaultStore(path: path);

  final anyVault = await store.vault<({String name})>();

  // Adds a string value to the vault
  await anyVault.put('key1', (name: 'value1'));
  print(await anyVault.get('key1'));

  // Creates a vault that stores Tasks from the previously created store
  final taskVault = await store.vault<Task>(
    name: 'taskVault',
    fromEncodable: Task.fromJson,
    eventListenerMode: EventListenerMode.synchronous,
  )
    ..on<VaultEntryCreatedEvent<Task>>().listen(
      (event) => print('Key "${event.entry.key}" added to the task vault'),
    );

  // Creates a vault that stores Contacts from the previously created store
  final contactVault = await store.vault<Contact>(
    name: 'contactVault',
    fromEncodable: (json) => Contact.fromJson(json),
    eventListenerMode: EventListenerMode.synchronous,
  )
    ..on<VaultEntryCreatedEvent<Contact>>().listen(
      (event) => print('Key "${event.entry.key}" added to the contact vault'),
    );

  // Adds a task with key 'task1' to the vault
  await taskVault.put(
    'task1',
    Task(id: 1, title: 'Run task vault store example', completed: true),
  );

  // Adds a contact with key 'contact1' to the vault
  await contactVault.put(
    'contact1',
    Contact(id: 1, name: 'Run contact vault store example'),
  );

  // Retrieves the value from the task vault
  print(await taskVault.get('task1'));

  // Retrieves the value from the contact vault
  print(await contactVault.get('contact1'));
}
// void main() async {
//   test('description2', () async {
//     final store = await newMemoryVaultStore();
// // Creates a vault from the previously created store
//     final stringVault = await store.vault<String>();
//
//     // Adds a new value to the vault
//     await stringVault.put('key1', 'value1');
//     // Creates a second vault from the previously created store
//     final anyVault = await store.vault<({String name})>();
//
//     // Adds a string value to the vault
//     await anyVault.put('key1', (name: 'value1'));
//
//     // Adds an int value to the vault
//     // await anyVault.put('key1', 1);
//   });
//
//   // test('description', () async {
//   //   // final n = Node()
//   //   //   ..effect = ToOne(target: Effect('increment', 1))
//   //   //   ..state = ToOne(target: State(1))
//   //   //   ..isRoot = true;
//   //   //
//   //   final n2 = Node();
//   //   //   ..effect = ToOne(target: Effect('increment', 1))
//   //   //   ..state = ToOne(target: State(1))
//   //   //   ..isRoot = false
//   //   //   ..parent = ToOne(target: n);
//   //   final ref = Ref(
//   //     'main',
//   //     ToOne(target: n2),
//   //   );
//   //   final store = openStore();
//   //
//   //   final result = Box<Ref>(store).put(ref);
//   //   final result4 = Box<Ref>(store).put(Ref('2', ToOne(target: n2)));
//   //   final result2 = Box<Ref>(store)
//   //       .query()
//   //       .order(Ref_.id, flags: Order.descending)
//   //       .build()
//   //       .findFirst();
//   //   final result3 = Box<Node>(store).query().build().findFirst();
//   //   expect(result2?.name, equals(ref.name));
//   // });
// }
