import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String usuario;

  const HomePage({super.key, required this.usuario});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController nombre = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController curso = TextEditingController();
  final TextEditingController ciudad = TextEditingController();
  final TextEditingController pais = TextEditingController();

  void guardar() {
    if (nombre.text.isEmpty ||
        direccion.text.isEmpty ||
        curso.text.isEmpty ||
        ciudad.text.isEmpty ||
        pais.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Completa todos los campos")),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Datos guardados"),
          content: Text(
            "Nombre: ${nombre.text}\n"
            "Dirección: ${direccion.text}\n"
            "Curso: ${curso.text}\n"
            "Ciudad: ${ciudad.text}\n"
            "País: ${pais.text}",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }

  void volver() {
    Navigator.pop(context);
  }

  Widget campo(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido ${widget.usuario}"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: volver,
            tooltip: "Cerrar sesión",
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [

                campo(nombre, "Nombre"),
                campo(direccion, "Dirección"),
                campo(curso, "Curso"),
                campo(ciudad, "Ciudad"),
                campo(pais, "País"),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: guardar,
                    child: const Text("Guardar"),
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: volver,
                    child: const Text("Volver"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}