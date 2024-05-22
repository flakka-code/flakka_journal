import 'package:flakka_journal/src/api/journal/schema/node.dart';
import 'package:objectbox/objectbox.dart';

///
@Entity()
class Ref {
  ///
  Ref(
    this.name,
    this.node, {
    this.id = 0,
  });

  ///
  @Id()
  int id;

  ///
  @Index()
  final String name;

//
// ///
  final ToOne<Node> node;
}
