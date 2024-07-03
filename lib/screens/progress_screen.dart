import 'package:excuela/config/blocs/progress_cubit/progress_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Progressscreen extends StatelessWidget {
  const Progressscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 15, 15, 15),
        title: const Text(
          'Widget de progreso',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          color: const Color.fromARGB(255, 8, 35, 39),
          child: const _ProgresView()),
    );
  }
}

// Ajusta la importación según donde tengas definido ProgressCubit

class _ProgresView extends StatelessWidget {
  const _ProgresView();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (_) async {
        BlocProvider.of<ProgressCubit>(context).reset();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Circular progress',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          Column(
            children: [
              const Text(
                'Circular lineal controlado',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<ProgressCubit, double>(
                builder: (context, state) {
                  return _CircularControlled(progressValue: state);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text('Iniciar'),
                    onPressed: () {
                      BlocProvider.of<ProgressCubit>(context).startProgress();
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CircularControlled extends StatelessWidget {
  final double progressValue;

  const _CircularControlled({required this.progressValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              value: progressValue,
            ),
          ),
        ],
      ),
    );
  }
}
