import 'package:excuela/config/blocs/card_cubit/card_cubit.dart';
import 'package:excuela/config/form/form.dart';
import 'package:excuela/config/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 15, 15, 15),
        title: const Text(
          'Card Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 8, 35, 39),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CardForm(),
            Expanded(
              child: BlocBuilder<CardCubit, List<CardModel>>(
                builder: (context, cards) {
                  return ListView.builder(
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      final card = cards[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.all(15),
                        elevation: 10,
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
      ),
    );
  }
}
