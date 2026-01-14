import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hover_provider.dart';
import 'hover_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = ['Flutter', 'Dart', 'Provider','Getx','REST APIs', 'Google Maps', 'Firebase', 'UI/UX','Figma'];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Skills', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      ChangeNotifierProvider(create: (_) => HoverProvider(),
      child: HoverCard(
        shadowColor: Color(0xff00d9ca),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Wrap(spacing: 10, runSpacing: 10, children: skills.map((s) => Chip(label: Text(s))).toList()),
          ),
        ),
      ),)

    ]);
  }
}
