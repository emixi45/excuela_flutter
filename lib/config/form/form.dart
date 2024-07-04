import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:excuela/config/blocs/card_cubit/card_cubit.dart';
import 'package:excuela/config/models/card_model.dart';
import 'package:flutter/material.dart';

class CardForm extends StatefulWidget {
  @override
  _CardFormState createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final card = CardModel(
        title: _titleController.text,
        description: _descriptionController.text,
      );
      context.read<CardCubit>().addCard(card);
      _titleController.clear();
      _descriptionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.lightGreen),
              ),
              style: const TextStyle(
                  color: Colors
                      .white), // Aquí se cambia el color del texto a blanco
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.lightGreen),
              ),
              style: const TextStyle(
                  color: Colors
                      .white), // Aquí se cambia el color del texto a blanco
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreen,
            ),
            onPressed: _submitForm,
            child: const Text(
              'Add Card',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
