import 'package:flutter/cupertino.dart';

import 'cat.dart';

sealed class AsyncCatState {}

class AsyncCatStateLoading extends AsyncCatState {}
class AsyncCatStateLoaded extends AsyncCatState {
  final List<Cat> data;

  AsyncCatStateLoaded(this.data);
}
class AsyncCatStateError extends AsyncCatState {
  final Object error;

  AsyncCatStateError(this.error);
}
