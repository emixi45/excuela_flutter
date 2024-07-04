import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<Color> {
  ThemeCubit() : super(Colors.white);

  void changeCardColor(Color color) {
    emit(color);
  }
}
