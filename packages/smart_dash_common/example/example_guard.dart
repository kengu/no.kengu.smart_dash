import 'package:smart_dash_common/smart_dash_common.dart';

void main() async {
  var statement = Awesome();
  final fact = guard(
    () => statement.isAwesome,
    task: 'awesome',
    name: 'some_task',
  );
  print('awesome: $fact');
}

class Awesome {
  Future<bool> get isAwesome => Future.value(true);
}
