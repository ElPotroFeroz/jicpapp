import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EB), // Fondo beige claro suave
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            ClipOval(
              child: Container(
                width: 40,
                height: 40,
                color: Colors.black,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.diamond_outlined, color: Colors.white, size: 20),
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MYM',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black, letterSpacing: 0.5),
                ),
                Text(
                  'BOLSA SOCIAL EDUCATIVA',
                  style: TextStyle(fontSize: 9, color: Colors.black54, letterSpacing: 1.5, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: FilledButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFD4AF37), // Dorado
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              ),
              child: const Text('Ingresar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            
            // Stats Grid 
            _buildStatsCard(context),
            
            const SizedBox(height: 48),
            
            // EL PROBLEMA
            _buildProblemaSection(context),
            
            const SizedBox(height: 40),
            
            // Cards Contraste
            _buildSistemaEducativoCard(context),
            const SizedBox(height: 24),
            _buildMundoRealCard(context),
            
            const SizedBox(height: 48),
            
            // JICP cierra la brecha CTA
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              decoration: BoxDecoration(
                color: const Color(0xFFEBE5D9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.bolt, color: Color(0xFFD4AF37)),
                  const SizedBox(width: 8),
                  Text(
                    'MYM cierra esta brecha',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFB8901D),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, color: Color(0xFFD4AF37)),
                ],
              ),
            ),
            
            const SizedBox(height: 48),
            
            // LA SOLUCION
            _buildSolucionSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF151515), // Oscuro casi negro
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.5), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _statItem(Icons.group_outlined, '1,450+', 'Estudiantes')),
                Expanded(child: _statItem(Icons.rocket_launch_outlined, '95+', 'Proyectos')),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(child: _statItem(Icons.monetization_on_outlined, '285K+', 'Inversión (JICP)')),
                Expanded(child: _statItem(Icons.domain, '12+', 'Instituciones')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _statItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFFD4AF37), size: 30),
        const SizedBox(height: 12),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildProblemaSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          const Text(
            '“Del aula a la idea,\nde la idea al proyecto real.”',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28, 
              fontWeight: FontWeight.w900, 
              height: 1.3, 
              color: Colors.black,
              fontStyle: FontStyle.italic
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'La plataforma que transforma la educación tradicional en una experiencia real de emprendimiento. Estudiantes crean empresas, gestionan finanzas y compiten en un mercado simulado con impacto real.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18, 
              color: Colors.black54, 
              height: 1.6, 
              fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSistemaEducativoCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
          ]
        ),
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: const Color(0xFFFFEBEE), borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.menu_book, color: Color(0xFFD32F2F)),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SISTEMA EDUCATIVO', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.black)),
                    Text('Modelo tradicional', style: TextStyle(color: Colors.black54, fontSize: 14)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            _bulletPoint('Contenido teórico desconectado de la realidad', const Color(0xFFD32F2F)),
            _bulletPoint('Falta de incentivos para innovar', const Color(0xFFD32F2F)),
            _bulletPoint('Memorización en lugar de aplicación práctica', const Color(0xFFD32F2F)),
            _bulletPoint('Miedo al fracaso, penalizado por notas', const Color(0xFFD32F2F)),
          ],
        ),
      ),
    );
  }

  Widget _buildMundoRealCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF151515),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: const Color(0xFFD4AF37).withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.language, color: Color(0xFFD4AF37)),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('MUNDO REAL', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.white)),
                    Text('Lo que exige el mercado', style: TextStyle(color: Colors.white60, fontSize: 14)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            _bulletPoint('Pensamiento crítico y resolución de problemas', const Color(0xFFD4AF37), true),
            _bulletPoint('Capacidad de gestionar recursos y finanzas', const Color(0xFFD4AF37), true),
            _bulletPoint('Crear valor, no solo consumir información', const Color(0xFFD4AF37), true),
            _bulletPoint('Trabajar en equipo bajo presión', const Color(0xFFD4AF37), true),
            _bulletPoint('Innovar y adaptarse constantemente', const Color(0xFFD4AF37), true),
            _bulletPoint('Resiliencia y aprendizaje del error', const Color(0xFFD4AF37), true),
          ],
        ),
      ),
    );
  }

  Widget _bulletPoint(String text, Color iconColor, [bool isDark = false]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Icon(Icons.circle, size: 8, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white70 : Colors.black87,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSolucionSection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF151515), // Oscuro puro
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 64.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.5)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('LA SOLUCIÓN', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.w900, fontSize: 11, letterSpacing: 1.5)),
          ),
          const SizedBox(height: 32),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white, height: 1.2),
              children: [
                TextSpan(text: 'MYM: '),
                TextSpan(text: 'El puente hacia\n', style: TextStyle(color: Colors.white)),
                TextSpan(text: 'el mundo real', style: TextStyle(color: Color(0xFFD4AF37))),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'A través de nuestra simulación de bolsa social, los estudiantes invierten en ideas, gestionan un portafolio y adquieren mentalidad inversora de forma interactiva.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white70, height: 1.6),
          ),
        ],
      ),
    );
  }
}
