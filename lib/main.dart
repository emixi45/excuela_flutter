import 'package:excuela/config/app_theme.dart';
import 'package:excuela/config/blocs/card_cubit/card_cubit.dart';
import 'package:excuela/config/blocs/progress_cubit/progress_cubit.dart';
import 'package:excuela/config/blocs/quiz_cubit/quiz_cubit.dart';
import 'package:excuela/config/blocs/theme_cubit/theme_cubit.dart';
import 'package:excuela/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProgressCubit(),
        ),
        BlocProvider(
          create: (context) => CardCubit(),
        ),
        BlocProvider(
          create: (context) => QuizCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(), // Registra el ThemeCubit
        ),
      ],
      child: BlocBuilder<ThemeCubit, Color>(
        builder: (context, cardColor) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme.copyWith(
              cardColor: cardColor, // Aplica el color de fondo de la tarjeta
            ),
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
