import 'package:excuela/config/models/card_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCubit extends Cubit<List<CardModel>> {
  CardCubit() : super([]);

  void addCard(CardModel card) {
    emit([...state, card]);
  }
}
