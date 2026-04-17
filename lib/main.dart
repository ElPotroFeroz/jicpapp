import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JICP Bolsa Social',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark, // Forzamos modo oscuro
      darkTheme: ThemeData(
        useMaterial3: true,
        // Usamos Roboto o la fuente nativa del sistema, pero bien contrastada
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4AF37), // Dorado
          onPrimary: Colors.black,
          secondary: Color(0xFFB8901D),
          surface: Color(0xFF151515), // Gris carbón
          surfaceContainerHighest: Color(0xFF222222), // Tarjetas elevadas
          onSurface: Colors.white,
          onSurfaceVariant: Colors.white70,
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0A0A), // Fondo principal casi negro
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFFD4AF37)), // Iconos dorados
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        dividerColor: Colors.white12,
      ),
      theme: ThemeData( // Fallback por si acaso
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
      ),
      home: const WelcomeScreen(),
    );
  }
}
