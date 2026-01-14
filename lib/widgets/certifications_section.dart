import 'package:bilal_portfolio/widgets/hover_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hover_provider.dart';

class CertificateItem {
  final String title;
  final String assetPath;

  CertificateItem({
    required this.title,
    required this.assetPath,
  });
}

class CertificationsSection extends StatelessWidget {
  final CertificateItem certificate;
  const CertificationsSection({super.key, required this.certificate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Certification',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ChangeNotifierProvider(
          create: (_) => HoverProvider(),
          child: HoverCard(
            shadowColor: Color(0xff00d9ca),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      certificate.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 6),


                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(certificate.assetPath,
                        width: MediaQuery.of(context).size.width * 0.40, // 75% of screen width
                        fit: BoxFit.contain,
                      ),

                    ),
                    const SizedBox(height: 8),

                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
