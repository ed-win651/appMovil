import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _callNumber(String number) async {
    final Uri url = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint('No se pudo abrir el marcador para $number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
        centerTitle: true,
        backgroundColor: Colors.orange[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'Líneas de Emergencia',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800],
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.local_police, color: Colors.black),
              label: const Text(
                'Policía Nacional - 105',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () => _callNumber('105'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.local_fire_department,
                color: Colors.black,
              ),
              label: const Text(
                'Bomberos - 116',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: Colors.red,
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () => _callNumber('116'),
            ),

            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.medical_services, color: Colors.black),
              label: const Text(
                'SAMU - 106',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: Colors.green,
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () => _callNumber('106'),
            ),
          ],
        ),
      ),
    );
  }
}
