import 'package:excuela/config/menu/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 15, 15),
        title: const Center(
          child: Text(
            'Inicio',
            style: TextStyle(
                color: Color.fromARGB(255, 226, 226, 226),
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 30),
          color: const Color.fromARGB(255, 8, 35, 39),
          child: const HomeView()),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            textColor: const Color.fromARGB(255, 251, 253, 251),
            title: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      size: 35,
                      menuItem.icon,
                      color: Colors.white70,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  menuItem.title,
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  menuItem.subTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 15),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Ir'),
                    Icon(
                      Icons.arrow_right_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            onTap: () => context.push(menuItem.link),
          ),
        );
      },
    );
  }
}
