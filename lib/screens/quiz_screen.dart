import 'package:excuela/config/blocs/quiz_cubit/quiz_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => QuizCubit(), child: const _CubitView());
  }
}

class _CubitView extends StatelessWidget {
  const _CubitView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 15, 15, 15),
        title: const Text(
          'Pregunta numero',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 8, 35, 39),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: Text(
                        state.questions[state.currentQuestion],
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                bool isValid = state.answers[
                                        state.questions[state.currentQuestion]]!
                                    .elementAt(index)
                                    .valid;
                                BlocProvider.of<QuizCubit>(context)
                                    .validAnswer(isValid);
                              },
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              tileColor: Colors.white,
                              title: Text(
                                state.answers[
                                        state.questions[state.currentQuestion]]!
                                    .elementAt(index)
                                    .answer,
                                textAlign: TextAlign.center,
                              ),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 16,
                            ),
                        itemCount: 4)
                  ],
                ),
              ),
              if (state.isCorrectAnswer != null)
                Center(
                    child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  child: state.isCorrectAnswer!
                      ? const Icon(
                          Icons.check,
                          size: 105,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.dangerous,
                          size: 105,
                          color: Colors.red,
                        ),
                )),
            ],
          );
        },
      ),
    );
  }
}
