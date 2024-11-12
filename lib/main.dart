import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botones pie de pagina - Ismael Vargas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BotonesPieDePagina(),
    );
  }
}

class BotonesPieDePagina extends StatelessWidget {
  const BotonesPieDePagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botones en pie de pagina - Ismael Vargas - 4to "A"'),
      ),
      body: const Center(
        child: Text('Contenido de la pantalla'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orangeAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
              color: Colors.blue,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              color: Colors.blue,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.phone),
              color: Colors.blue,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
              color: Colors.blue,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.help),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
