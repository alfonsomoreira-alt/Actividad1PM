import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  bool obscureText = true;

  void login() {
    String usuario = usuarioController.text;
    String senha = senhaController.text;

    if (usuario.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Completa todos los campos")),
      );
      return;
    }

    if (usuario == "Suarez" && senha == "1234") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(usuario: usuario),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuario o contraseña incorrectos")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ✅ IMAGEN CORREGIDA
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/suarez.jpg"),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: 280,
              child: TextField(
                controller: usuarioController,
                decoration: const InputDecoration(
                  labelText: "Usuario",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: 280,
              child: TextField(
                controller: senhaController,
                obscureText: obscureText,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: login,
              child: const Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}