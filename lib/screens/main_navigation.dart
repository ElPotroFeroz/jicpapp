import 'package:flutter/material.dart';
import '../mock_data.dart';
import 'market_screen.dart';
import 'profile_screen.dart';
import 'learning_screen.dart';
import 'welcome_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0; // 0: Dashboard, 1: Mercado, 2: Aprendizaje

  final List<String> _titles = [
    'Dashboard / Perfil',
    'Mercado de Proyectos',
    'Aprendizaje'
  ];

  final List<Widget> _screens = [
    const ProfileScreen(),
    const MarketScreen(),
    const LearningScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Cerrar el Drawer después de hacer clic
    Navigator.pop(context);
  }

  Widget _buildNavItem(IconData iconOutlined, IconData iconFilled, String title, int index) {
    final isSelected = _selectedIndex == index;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFD4AF37).withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          isSelected ? iconFilled : iconOutlined,
          color: isSelected ? const Color(0xFFD4AF37) : Colors.white60,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? const Color(0xFFD4AF37) : Colors.white60,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        onTap: () => _onItemTapped(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = MockData.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
        ),
        // El ícono de menú hamburguesa aparece automáticamente porque tenemos un "drawer"
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF151515), // Carbon
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cabecera del Menú Lateral
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF0F0F0F),
                border: Border(bottom: BorderSide(color: Color(0xFFD4AF37), width: 1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: const Color(0xFFD4AF37),
                        backgroundImage: NetworkImage(user.profileImageUrl),
                        onBackgroundImageError: (_, __) {},
                        child: user.profileImageUrl.isEmpty
                            ? const Icon(Icons.person, color: Colors.black, size: 28)
                            : null,
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD4AF37).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.3)),
                        ),
                        child: Text(
                          'Nivel ${user.level}',
                          style: const TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    user.name,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Text(
                    'Inversor / Alumno',
                    style: TextStyle(color: Colors.white60, fontSize: 13),
                  ),
                ],
              ),
            ),
            
            // Opciones de Navegación
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildNavItem(Icons.dashboard_outlined, Icons.dashboard, 'Dashboard', 0),
                  _buildNavItem(Icons.storefront_outlined, Icons.storefront, 'Mercado', 1),
                  _buildNavItem(Icons.school_outlined, Icons.school, 'Aprendizaje', 2),
                  
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    child: Divider(color: Colors.white12),
                  ),
                  
                  // Saldo JICP (Reubicado debajo de Aprendizaje)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A0A0A),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFD4AF37).withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Saldo Total JICP', style: TextStyle(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD4AF37).withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.account_balance_wallet, color: Color(0xFFD4AF37), size: 18),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              user.balance.toStringAsFixed(2),
                              style: const TextStyle(
                                color: Color(0xFFD4AF37), 
                                fontWeight: FontWeight.w900, 
                                fontSize: 24,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const Divider(color: Colors.white12, height: 1),
            
            // Cerrar Sesión
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.white54),
                title: const Text('Cerrar sesión', style: TextStyle(color: Colors.white54)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                onTap: () {
                  // Navegamos de vuelta al Login destruyendo el historial de screens
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                    (route) => false,
                  );
                },
              ),
            ),
            const SizedBox(height: 8), // Espaciado final adaptativo
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
