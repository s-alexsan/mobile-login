import 'dart:async';

class Loading {
  bool loading = false;
  String msg = '';

  bool get search => loading;

  final _streamController = StreamController<bool>.broadcast();

  Stream<bool> get stream => _streamController.stream;

  void change() {
    loading = !loading;
    _streamController.sink.add(loading);
  }

  close() {
    _streamController.close();
  }
}
