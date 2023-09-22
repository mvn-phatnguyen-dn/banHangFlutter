import 'package:rxdart/rxdart.dart';
import '../../base/base_view_model.dart';

mixin Input {
  BehaviorSubject<int> housingComplexStream = BehaviorSubject<int>();
  PublishSubject<void> btnUpdateStream = PublishSubject<void>();
}

mixin Output {
  PublishSubject<Object> errorStream = PublishSubject<Object>();
}

class DetailViewModel extends BaseViewModel<Input, Output> with Input, Output {
  @override
  get input => this;

  @override
  get output => this;

  void changeInfo() {}
}
