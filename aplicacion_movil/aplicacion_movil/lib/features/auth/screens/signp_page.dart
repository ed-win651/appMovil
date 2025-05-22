import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/login_button.dart';

class SignpPage extends StatefulWidget {
  @override
  _SignpPageState createState() => _SignpPageState();
}

class _SignpPageState extends State<SignpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Cuenta'),
        backgroundColor: Colors.orange[700],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Icon(Icons.person_add_alt_1_outlined, size: 80, color: Colors.orange[700]),
            SizedBox(height: 16),
            Text(
              'Regístrate para continuar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange[800]),
            ),
            SizedBox(height: 32),
            CustomTextField(
              controller: _nameController,
              labelText: 'Nombre completo',
              prefixIcon: Icons.person_outline,
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: _emailController,
              labelText: 'Correo electrónico',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: _passwordController,
              labelText: 'Contraseña',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: _confirmPasswordController,
              labelText: 'Confirmar contraseña',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
            ),
            SizedBox(height: 32),
            LoginButton(
              onPressed: () {
                // Aquí puedes agregar la lógica de validación y registro
                print('Registrando: ${_nameController.text}, ${_emailController.text}');
              },
              label: 'Crear Cuenta',
            ),
            SizedBox(height: 24),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Regresa a la pantalla de login
              },
              child: Text(
                '¿Ya tienes una cuenta? Inicia sesión',
                style: TextStyle(color: Colors.orange[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
