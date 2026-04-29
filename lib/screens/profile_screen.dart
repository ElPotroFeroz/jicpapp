import 'package:flutter/material.dart';
import '../mock_data.dart';
import 'welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEntrepreneurRankExpanded = false;
  bool _isInvestorRankExpanded = false;

  @override
  Widget build(BuildContext context) {
    final user = MockData.currentUser;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        children: [
          // Perfil y Foto
          CircleAvatar(
            radius: 60,
            backgroundColor: const Color(0xFFD4AF37),
            backgroundImage: NetworkImage(user.profileImageUrl),
            onBackgroundImageError: (_, __) {},
            child: user.profileImageUrl.isEmpty
                ? const Icon(Icons.person, color: Colors.black, size: 60)
                : null,
          ),
          const SizedBox(height: 16),
          
          // Estrellas del profesor
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) => const Icon(Icons.star, color: Color(0xFFD4AF37), size: 28)),
          ),
          const Text('Calificación del Profesor', style: TextStyle(color: Colors.white38, fontSize: 11)),
          
          const SizedBox(height: 16),
          Text(
            user.name,
            style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Colegio Ejemplo (Simulado)',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          
          const SizedBox(height: 16),
          
          // Actividad (Fuego)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.orange.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.local_fire_department, color: Colors.orange, size: 24),
                const SizedBox(width: 8),
                const Text('7 días de racha', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                const SizedBox(width: 12),
                ...List.generate(3, (index) => const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Icon(Icons.local_fire_department, color: Colors.orange, size: 16),
                )),
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Rankings
          _buildRankingCard(
            title: 'Ranking: Mejor Emprendedor',
            icon: Icons.rocket_launch,
            rank: '#3',
            description: 'Basado en el éxito de tus proyectos propios',
            isExpanded: _isEntrepreneurRankExpanded,
            onTap: () {
              setState(() {
                _isEntrepreneurRankExpanded = !_isEntrepreneurRankExpanded;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildRankingCard(
            title: 'Ranking: Mejor Inversor',
            icon: Icons.trending_up,
            rank: '#12',
            description: 'Basado en el retorno de tus inversiones externas',
            color: Colors.blueAccent,
            isExpanded: _isInvestorRankExpanded,
            onTap: () {
              setState(() {
                _isInvestorRankExpanded = !_isInvestorRankExpanded;
              });
            },
          ),
          
        ],
      ),
    );
  }

  Widget _buildRankingCard({
    required String title,
    required IconData icon,
    required String rank,
    required String description,
    required bool isExpanded,
    required VoidCallback onTap,
    Color color = const Color(0xFFD4AF37),
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF151515),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 4),
                      Text(description, style: const TextStyle(color: Colors.white38, fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      rank,
                      style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                    Icon(
                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: color.withOpacity(0.8),
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
            if (isExpanded) ...[
              const SizedBox(height: 20),
              const Divider(color: Colors.white12),
              const SizedBox(height: 10),
              // Simulación de ranking completo
              _buildRankItem(1, 'Carlos Ruiz', '9.5 pts', true),
              _buildRankItem(2, 'Ana Belén', '9.2 pts', false),
              _buildRankItem(3, 'Tú', '8.9 pts', false, color),
              _buildRankItem(4, 'David Soto', '8.5 pts', false),
              _buildRankItem(5, 'Elena Marín', '8.1 pts', false),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRankItem(int position, String name, String points, bool isFirst, [Color? highlightColor]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isFirst ? const Color(0xFFD4AF37) : Colors.white12,
              shape: BoxShape.circle,
            ),
            child: Text(
              position.toString(),
              style: TextStyle(
                color: isFirst ? Colors.black : Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            name,
            style: TextStyle(
              color: highlightColor ?? Colors.white,
              fontWeight: highlightColor != null ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const Spacer(),
          Text(points, style: const TextStyle(color: Colors.white38, fontSize: 12)),
        ],
      ),
    );
  }
}
