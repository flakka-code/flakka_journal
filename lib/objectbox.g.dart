// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;

import 'src/api/journal/schema/node.dart';
import 'src/api/journal/schema/ref.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 1700102107691348293),
      name: 'Ref',
      lastPropertyId: const obx_int.IdUid(4, 8433943370666120662),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1674430799210212362),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 2599347588776958025),
            name: 'name',
            type: 9,
            flags: 2048,
            indexId: const obx_int.IdUid(4, 1095954036828631775)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 8433943370666120662),
            name: 'nodeId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(9, 6615830428631819695),
            relationTarget: 'Node')
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(6, 8038451847376059800),
      name: 'Node',
      lastPropertyId: const obx_int.IdUid(1, 1666361140431621551),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1666361140431621551),
            name: 'id',
            type: 6,
            flags: 1)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
obx.Store openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) {
  return obx.Store(getObjectBoxModel(),
      directory: directory,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(6, 8038451847376059800),
      lastIndexId: const obx_int.IdUid(9, 6615830428631819695),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [
        7904037816723557620,
        5352937915036814443,
        6903046623980757455,
        6435952505856710156
      ],
      retiredIndexUids: const [2108130998290406379],
      retiredPropertyUids: const [
        7943732910260841096,
        2061085685800976634,
        4136028784286030915,
        2186988367225188170,
        1711155039619311398,
        7704272870370688708,
        4101246829181443657,
        6150498380873133108,
        4881647942832356759,
        7351749621014785765,
        1930708512694991747,
        390319071696579083,
        2452111805556731495,
        8922476502191759569,
        7736727300757288073,
        5846970690517888400,
        5585068755452310983,
        4884943249796229882
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Ref: obx_int.EntityDefinition<Ref>(
        model: _entities[0],
        toOneRelations: (Ref object) => [object.node],
        toManyRelations: (Ref object) => {},
        getId: (Ref object) => object.id,
        setId: (Ref object, int id) {
          object.id = id;
        },
        objectToFB: (Ref object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(3, object.node.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final nodeParam = obx.ToOne<Node>(
              targetId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0));
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final object = Ref(nameParam, nodeParam, id: idParam);
          object.node.attach(store);
          return object;
        }),
    Node: obx_int.EntityDefinition<Node>(
        model: _entities[1],
        toOneRelations: (Node object) => [],
        toManyRelations: (Node object) => {},
        getId: (Node object) => object.id,
        setId: (Node object, int id) {
          object.id = id;
        },
        objectToFB: (Node object, fb.Builder fbb) {
          fbb.startTable(2);
          fbb.addInt64(0, object.id);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final object = Node(id: idParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Ref] entity fields to define ObjectBox queries.
class Ref_ {
  /// see [Ref.id]
  static final id = obx.QueryIntegerProperty<Ref>(_entities[0].properties[0]);

  /// see [Ref.name]
  static final name = obx.QueryStringProperty<Ref>(_entities[0].properties[1]);

  /// see [Ref.node]
  static final node =
      obx.QueryRelationToOne<Ref, Node>(_entities[0].properties[2]);
}

/// [Node] entity fields to define ObjectBox queries.
class Node_ {
  /// see [Node.id]
  static final id = obx.QueryIntegerProperty<Node>(_entities[1].properties[0]);
}