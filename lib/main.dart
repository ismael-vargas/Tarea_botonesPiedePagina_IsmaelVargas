import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Botones Completos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BotonesCompletos(),
    );
  }
}

class BotonesCompletos extends StatefulWidget {
  const BotonesCompletos({super.key});

  @override
  State<BotonesCompletos> createState() => _BotonesCompletosState();
}

class _BotonesCompletosState extends State<BotonesCompletos> {
  bool toggleValue = false;
  bool isReadMorePressed = false;

  // Para los radio buttons de "Sí" y "No"
  String? selectedOption = "Sí";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botones Completos - Ismael Vargas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: toggleValue,
                    onChanged: (value) {
                      setState(() {
                        toggleValue = value;
                      });
                    },
                  ),
                  Text(
                    toggleValue ? "Encendido" : "Apagado",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    isReadMorePressed = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    isReadMorePressed = false;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  decoration: BoxDecoration(
                    color: isReadMorePressed ? Colors.deepPurple : Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Text(
                    "READ MORE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              FloatingActionButton.extended(
                onPressed: () async {
                  FilePickerResult? result = (await FilePicker.platform.pickFiles()) as FilePickerResult?;

                  if (result != null) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Archivo seleccionado: ${result.files.single.name}")),
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("No se seleccionó ningún archivo.")),
                    );
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text("Agregar"),
                backgroundColor: const Color.fromARGB(255, 196, 170, 240),
              ),
              const SizedBox(height: 20),

              PopupMenuButton<String>(
                onSelected: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Seleccionaste: $value")),
                  );
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: "Opción 1",
                    child: Text("Opción 1"),
                  ),
                  const PopupMenuItem(
                    value: "Opción 2",
                    child: Text("Opción 2"),
                  ),
                  const PopupMenuItem(
                    value: "Opción 3",
                    child: Text("Opción 3"),
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.menu, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Desplegable",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: const Text("Guardado con éxito"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cerrar"),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.save),
                label: const Text("Guardar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 177, 241, 241),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "Selecciona una opción:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: "Sí",
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                  const Text("Sí"),
                  const SizedBox(width: 20),
                  Radio<String>(
                    value: "No",
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                  const Text("No"),
                ],
              ),
              const SizedBox(height: 20),

              // Reemplazamos el "Nuevo Botón" con el "LikeButton"
              const LikeButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
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

class FilePickerResult {
  get files => null;
}

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: isLiked ? Colors.red : Colors.blue, // Cambia el color basado en el estado
        ),
        onPressed: () {
          setState(() {
            isLiked = !isLiked; // Alterna el estado de "like"
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isLiked ? "LIKED" : "LIKE", // Cambia el texto dependiendo del estado
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: Icon(
                Icons.favorite,
                color: isLiked ? Colors.red : Colors.blue, // Cambia el color del ícono
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
