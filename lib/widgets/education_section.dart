import 'package:flutter/material.dart';

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
        Card(
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
                  institution: 'Virtual University of Pakistan',

                ),
                const Divider(height: 24),

                _buildEducationItem(
                  title: '3-Year Diploma in ACCP EE',
                  institution: 'Aptech Learning North Nazimabad',

                ),
                const Divider(height: 24),

                _buildEducationItem(
                  title: 'Higher Education (Intermediate in Commerce)',
                  institution: 'Government Islamia Arts & Commerce College Karachi',

                ),
                const Divider(height: 24),

                _buildEducationItem(
                  title: 'Secondary Education (Matriculation in Science)',
                  institution: 'Government Boys Secondary School, Karachi',

                ),
              ],
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
            color: Colors.grey[700],
          ),
        ),


      ],
    );
  }
}
