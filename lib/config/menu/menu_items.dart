import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Widget de Progreso Interactivo',
    subTitle: 'Barra de progreso circular',
    link: '/ProgresScreen',
    icon: Icons.refresh_sharp,
  ),
  MenuItems(
    title: 'Widget de Tarjeta Educativa',
    subTitle: 'Tarjeta con imagen,titulo descripcion',
    link: '/CardScreen',
    icon: Icons.category_rounded,
  ),
  MenuItems(
    title: 'Widget de Quiz Personalizado',
    subTitle: 'crear preguntas de opcion multiple, v o f',
    link: '/QuizScreen',
    icon: Icons.quiz,
  ),
];
