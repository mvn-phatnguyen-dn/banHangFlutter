import 'dart:async';

mixin DisposableMixin {
  final List<StreamSubscription> _subscriptions = <StreamSubscription>[];

  void cancelSubscriptions() {
    for (StreamSubscription subscription in _subscriptions) {
      subscription.cancel();
    }
  }

  void addSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }
}

extension DisposableStreamSubscriton on StreamSubscription {
  void canceledBy(DisposableMixin disposable) {
    disposable.addSubscription(this);
  }
}
