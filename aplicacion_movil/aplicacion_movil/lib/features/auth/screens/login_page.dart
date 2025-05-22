import 'package:flutter/material.dart';
import '../widgets/login_button.dart';
import '../widgets/google_signin_button.dart';
import 'signp_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.shield_outlined, size: 80.0, color: Colors.orange[700]),
              SizedBox(height: 16.0),
              Text('Lima en Acción', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.orange[800])),
              SizedBox(height: 8.0),
              Text('Inicia sesión para continuar', style: TextStyle(fontSize: 16.0, color: Colors.grey[700])),
              SizedBox(height: 32.0),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico o número de teléfono',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              SizedBox(height: 24.0),
              LoginButton(
                onPressed: () {
                  print('Iniciar Sesión con: ${_emailController.text}, ${_passwordController.text}');
                },
              ),
              SizedBox(height: 16.0),
              GoogleSignInButton(
                onPressed: () {
                  print('Registro con Google');
                },
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  print("Redirigir a recuperar contraseña");
                },
                child: Text('¿Olvidaste tu contraseña?', style: TextStyle(color: Colors.blue)),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('¿No tienes una cuenta? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignpPage()));
                    },
                    child: Text('Registrarse', style: TextStyle(color: Colors.orange[700], fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
