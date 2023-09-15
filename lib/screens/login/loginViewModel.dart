import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../../base/base_view_model.dart';

mixin Input {
  BehaviorSubject<bool> obscureText = BehaviorSubject<bool>.seeded(false);

  // bỏ
  BehaviorSubject<int> detachedHouseStream = BehaviorSubject<int>();
  BehaviorSubject<int> housingComplexStream = BehaviorSubject<int>();
  PublishSubject<void> btnUpdateStream = PublishSubject<void>();
  BehaviorSubject<bool> isLoadingStream = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<String> addresStream = BehaviorSubject<String>();
  BehaviorSubject<void> postCodeStream = BehaviorSubject<void>();
}

mixin Output {
  PublishSubject<Object> errorStream = PublishSubject<Object>();
}

class LoginViewModel extends BaseViewModel<Input, Output> with Input, Output {
  @override
  get input => this;

  @override
  get output => this;

  void changeInfo() {
    input.btnUpdateStream.sink.add(null);
  }
}
