import 'package:final_flutter_project/base/disposable.dart';

abstract class BaseViewModel<Input, Output> with DisposableMixin {
  Input get input;
  Output get output;

  void dispose() {}
}
