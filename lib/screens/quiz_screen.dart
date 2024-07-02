import 'package:excuela/config/blocs/Countercubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterCubit(), child: _CubitView());
  }
}

class _CubitView extends StatelessWidget {
  const _CubitView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 15, 15, 15),
          title: Text(
            'Widget Quiz  ${counterState.transactionCount}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () => {context.read<CounterCubit>().reset()},
              icon: const Icon(
                Icons.refresh,
              ),
            ),
          ]),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Container(
            color: const Color.fromARGB(255, 8, 35, 39),
            child: Center(
              child: Text(
                'counter value ${state.counter}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1',
              child: Text('+1'),
              onPressed: () => {context.read<CounterCubit>().increaseBy(1)}),
          const SizedBox(height: 10),
          FloatingActionButton(
              heroTag: '2',
              child: Text('+2'),
              onPressed: () => {context.read<CounterCubit>().increaseBy(2)}),
          const SizedBox(height: 10),
          FloatingActionButton(
              heroTag: '3',
              child: Text('+3'),
              onPressed: () => {context.read<CounterCubit>().increaseBy(3)}),
        ],
      ),
    );
  }
}
