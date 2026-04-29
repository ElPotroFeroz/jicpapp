import 'package:flutter/material.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  String? _selectedCategory;
  final List<String> _categories = ['Tecnología', 'Salud', 'Finanzas', 'Educación', 'Media'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Nuevo Proyecto Emprendedor',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          const Text(
            'Completa los datos de tu idea de negocio',
            style: TextStyle(color: Colors.white38, fontSize: 14),
          ),
          const SizedBox(height: 32),
          
          _buildTextField('Nombre del Proyecto', Icons.rocket_launch),
          const SizedBox(height: 16),
          
          _buildDropdownField(),
          const SizedBox(height: 16),
          
          _buildTextField('Descripción del Proyecto', Icons.description, maxLines: 3),
          const SizedBox(height: 16),
          
          _buildTextField('Patente del Proyecto / Registro', Icons.verified_user),
          const SizedBox(height: 16),
          
          _buildImagePickerPlaceholder(),
          const SizedBox(height: 16),
          
          _buildTextField(
            'Desglose de inversión inicial', 
            Icons.list_alt, 
            maxLines: 3, 
            hintText: 'Ej: Materiales 50 JICP, Servidor 20 JICP...'
          ),
          const SizedBox(height: 16),
          
          _buildTextField('Total de inversión necesaria (JICP)', Icons.monetization_on, keyboardType: TextInputType.number),
          
          const SizedBox(height: 40),
          
          FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Proyecto enviado a revisión por el profesor'),
                  backgroundColor: Color(0xFFD4AF37),
                ),
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFD4AF37),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 5,
            ),
            child: const Text('Publicar Proyecto', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCategory,
          hint: const Text('Seleccionar Categoría', style: TextStyle(color: Colors.white54)),
          dropdownColor: const Color(0xFF151515),
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: Color(0xFFD4AF37)),
          style: const TextStyle(color: Colors.white, fontSize: 16),
          items: _categories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCategory = newValue;
            });
          },
        ),
      ),
    );
  }

  Widget _buildImagePickerPlaceholder() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12, style: BorderStyle.solid),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_a_photo, color: Colors.white38),
            SizedBox(height: 8),
            Text('Imagen Principal (Opcional)', style: TextStyle(color: Colors.white38, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, {int maxLines = 1, TextInputType? keyboardType, String? hintText}) {
    return TextField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white24, fontSize: 12),
        labelStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: const Color(0xFFD4AF37), size: 20),
        filled: true,
        fillColor: const Color(0xFF151515),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFD4AF37)),
        ),
      ),
    );
  }
}
