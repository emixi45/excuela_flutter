import 'dart:async';

import 'package:bloc/bloc.dart';

class ProgressCubit extends Cubit<double> {
  ProgressCubit() : super(0.0);

  StreamSubscription<double>? _progressSubscription;

  void startProgress() {
    reset();
    _progressSubscription =
        Stream.periodic(const Duration(milliseconds: 300), (value) {
      return (value * 2) / 100;
    }).takeWhile((value) => value < 100).listen((value) {
      emit(value);
    });
  }

  void reset() {
    _progressSubscription?.cancel();
    emit(0.0);
  }

  @override
  Future<void> close() {
    _progressSubscription?.cancel();
    return super.close();
  }
}
