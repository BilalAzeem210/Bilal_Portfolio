import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = ['Flutter', 'Dart', 'Provider','Getx','REST APIs', 'Google Maps', 'Firebase', 'UI/UX','Figma'];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Skills', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Wrap(spacing: 10, runSpacing: 10, children: skills.map((s) => Chip(label: Text(s))).toList()),
        ),
      ),
    ]);
  }
}
