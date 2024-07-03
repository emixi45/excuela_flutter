import 'package:excuela/config/blocs/card_cubit/card_cubit.dart';
import 'package:excuela/config/form/form.dart';
import 'package:excuela/config/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card Screen')),
      body: Column(
        children: [
          CardForm(),
          Expanded(
            child: BlocBuilder<CardCubit, List<CardModel>>(
              builder: (context, cards) {
                return ListView.builder(
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    return Card(
                      child: ListTile(
                        title: Text(card.title),
                        subtitle: Text(card.description),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
