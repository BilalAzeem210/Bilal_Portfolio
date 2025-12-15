import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      const Text('About Me', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('I’m a Flutter Developer with 2.5+ years of experience building high-performance, cross-platform mobile and web apps. I specialize in Flutter and Dart, with a focus on clean architecture, modern UI design, and seamless performance.'
                'Over the years, I’ve worked on projects that combine smart functionality with elegant design — from real-time tracking apps to AI-integrated solutions. '
                'I’m passionate about transforming ideas into polished digital products and continuously learning new technologies.'
                'Currently, I’m exploring the integration of AI with Flutter and open to freelance opportunities that challenge me to grow and create meaningful apps.',
            ),

          ]),
        ),
      ),
    ]);
  }
}
