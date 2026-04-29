import 'package:flutter/material.dart';
import '../mock_data.dart';
import 'market_screen.dart';
import 'wallet_detail_screen.dart';
import 'investment_detail_screen.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = MockData.currentUser;

    return Column(
      children: [
        // Resumen de Wallet
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF151515),
            border: Border(bottom: BorderSide(color: Colors.white10)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBalanceItem(context, 'Balance Wallet', '${user.balance} JICP', Icons.account_balance_wallet, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const WalletDetailScreen()));
                  }),
                  _buildBalanceItem(context, 'Valor Inversiones', '${user.totalInvestment} JICP', Icons.trending_up, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const InvestmentDetailScreen()));
                  }),
                ],
              ),
            ],
          ),
        ),
        
        // Tabs
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  indicatorColor: Color(0xFFD4AF37),
                  labelColor: Color(0xFFD4AF37),
                  unselectedLabelColor: Colors.white54,
                  labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  tabs: [
                    Tab(text: 'Mis Proyectos'),
                    Tab(text: 'Invertidos'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildProjectList(context, MockData.myProjects, false),
                      _buildProjectList(context, MockData.featuredProjects, true), 
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceItem(BuildContext context, String label, String value, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFFD4AF37), size: 28),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectList(BuildContext context, List<Project> projects, bool isInvestedTab) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF151515),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white12),
          ),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectDetailScreen(
                    project: project,
                    userShares: isInvestedTab ? (index + 2) * 5.0 : null,
                    userValue: isInvestedTab ? (index + 2) * 5.0 * project.price : null,
                  ),
                ),
              );
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Hero(
              tag: 'image_${project.title}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  project.imageUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 48,
                    height: 48,
                    color: Colors.white12,
                    child: const Icon(Icons.rocket_launch, color: Color(0xFFD4AF37)),
                  ),
                ),
              ),
            ),
            title: Text(project.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Por: ${project.creator}', style: const TextStyle(color: Colors.white38, fontSize: 12)),
                Text('Valor actual: ${project.price} JICP', style: const TextStyle(color: Colors.white54)),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  index % 2 == 0 ? '+${(index + 5) * 3}%' : '-${(index + 2) * 4}%',
                  style: TextStyle(
                    color: index % 2 == 0 ? Colors.greenAccent : Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const Text('7d', style: TextStyle(color: Colors.white24, fontSize: 10)),
              ],
            ),
          ),
        );
      },
    );
  }
}
