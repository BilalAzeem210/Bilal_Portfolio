import 'package:bilal_portfolio/widgets/hover_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hover_provider.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Education',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // Single Education Card
        ChangeNotifierProvider(
          create: (_) => HoverProvider(),
          child: HoverCard(
            shadowColor: Color(0xff00d9ca).withOpacity(0.5),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: isDark ? Colors.grey[900] : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEducationItem(
                      title: 'BSCS (Bachelor of Science in Computer Science)',
                      institution: 'Virtual University of Pakistan (2025 - Present)',

                    ),
                    const Divider(height: 24),

                    _buildEducationItem(
                      title: '3-Year Diploma in ACCP EE',
                      institution: 'Aptech Learning North Nazimabad (2017 - 2020)',

                    ),
                    const Divider(height: 24),

                    _buildEducationItem(
                      title: 'Intermediate in Commerce',
                      institution: 'Government Islamia Arts & Commerce College Karachi (2010 - 2012)',

                    ),
                    const Divider(height: 24),

                    _buildEducationItem(
                      title: 'Matriculation in Science',
                      institution: 'Government Boys Secondary School, Karachi (2008 - 2010)',

                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEducationItem({
    required String title,
    required String institution,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          institution,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[500],
          ),
        ),


      ],
    );
  }
}
