import 'package:flutter/material.dart';
import '../home/screens/sos_page.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  int _selectedBottomIndex = 0;

  void _onBottomItemTapped(int index) {
    if (index == 2) {
      // Botón SOS presionado - navegar a SosPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SosPage()),
      );
    } else {
      setState(() {
        _selectedBottomIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[700],
          title: Row(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'hola oño',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.account_circle),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black38,
            tabs: [
              Tab(text: 'INICIO'),
              Tab(text: 'REPORTAR DELITOS'),
              Tab(text: 'HACER DENUNCIAS'),
              Tab(text: 'NOTICIAS'),
              Tab(text: 'MAPA DE DELITOS'),
              Tab(text: 'CAMINAR SEGURO(A)'),
              Tab(text: 'ALERTA LLAMADAS EXTORXCIVAS'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Contenido de Principal')),
            Center(child: Text('Contenido de reportar delitos')),
            Center(child: Text('Contenido de hacer denuncias')),
            Center(child: Text('Contenido de noticias')),
            Center(child: Text('Contenido de mapa de delitos ')),
            Center(child: Text('Contenido de caminar seguro(a)')),
            Center(child: Text('Contenido de aleta de llamadas extorcivasA')),
          ],
        ),
        // Aquí agregamos la barra de navegación inferior
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Primer botón - Inicio
              _buildNavItem(
                icon: Icons.home,
                label: 'Inicio',
                index: 0,
                isSelected: _selectedBottomIndex == 0,
              ),

              // Segundo botón - Reportes
              _buildNavItem(
                icon: Icons.report,
                label: 'Reportes',
                index: 1,
                isSelected: _selectedBottomIndex == 1,
              ),

              // Botón SOS central
              GestureDetector(
                onTap: () => _onBottomItemTapped(2),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red,
                    child: Text(
                      'SOS',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              // Cuarto botón - Mapa
              _buildNavItem(
                icon: Icons.map,
                label: 'Mapa',
                index: 3,
                isSelected: _selectedBottomIndex == 3,
              ),

              // Quinto botón - Perfil
              _buildNavItem(
                icon: Icons.person,
                label: 'Perfil',
                index: 4,
                isSelected: _selectedBottomIndex == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => _onBottomItemTapped(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.orange[700] : Colors.grey,
              size: 24,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.orange[700] : Colors.grey,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
