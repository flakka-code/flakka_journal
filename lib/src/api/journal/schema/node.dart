import 'package:flakka_journal/objectbox.g.dart';
import 'package:flakka_journal/src/api/journal/schema/effect.dart';
import 'package:flakka_journal/src/api/journal/schema/state.dart';
import 'package:objectbox/objectbox.dart';

///
@Entity()
class Node {
  Node({
    this.id = 0,
  });

  ///
  @Id()
  int id;

  ///
  //  final ToOne<Effect> effect;

  ///
  //  final ToOne<Node> parent;

  ///
  //  final bool isRoot;

  ///
  //  final ToOne<State> state;

  ///
  //  final int time;
}
