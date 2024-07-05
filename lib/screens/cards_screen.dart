import 'package:excuela/config/blocs/card_cubit/card_cubit.dart';
import 'package:excuela/config/blocs/theme_cubit/theme_cubit.dart';
import 'package:excuela/config/form/form.dart';
import 'package:excuela/config/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Card Screen',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.color_lens),
            onPressed: () {
              // Muestra un cuadro de diálogo para seleccionar el color
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Selecciona un color'),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                        pickerColor: Theme.of(context).cardColor,
                        onColorChanged: (color) {
                          context.read<ThemeCubit>().changeCardColor(color);
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const CardForm(),
          Expanded(
            child: BlocBuilder<CardCubit, List<CardModel>>(
              builder: (context, cards) {
                return ListView.builder(
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    return Card(
                      color: Theme.of(context)
                          .cardColor, // Usa el color de fondo del tema
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.all(15),
                      elevation: 10,
                      child: ListTile(
                        title: Text(card.title),
                        subtitle: Text(card.description),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            context.read<CardCubit>().removeCard(card);
                          },
                        ),
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
