import 'package:bilal_portfolio/widgets/hover_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hover_provider.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      const Text('About Me', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      ChangeNotifierProvider(
        create: (_) => HoverProvider(),
        child: HoverCard(
          shadowColor: Color(0xff00d9ca),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "I’m a Flutter Developer with 3+ years of experience building cross-platform mobile and web applications. "
                      "I specialize in developing scalable, well-structured apps using clean architecture and modern UI practices.\n\n"
                      "I’ve worked on real-world projects including live tracking systems, business applications, and API-driven solutions, "
                      "with a strong focus on performance and usability.\n\n"
                      "Currently, I’m exploring AI integration with Flutter and I’m available for freelance opportunities.",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.left,
                )

              ]),
            ),
          ),
        ),
      ),
    ]);
  }
}
