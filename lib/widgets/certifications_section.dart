import 'package:bilal_portfolio/widgets/hover_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/certificate_item.dart';
import '../providers/hover_provider.dart';



class CertificationsSection extends StatelessWidget {
  final CertificateItem certificate;

  const CertificationsSection({
    super.key,
    required this.certificate,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;
    bool isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Certification',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        ChangeNotifierProvider(
          create: (_) => HoverProvider(),
          child: HoverCard(
            shadowColor: const Color(0xff00d9ca),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: isMobile
                    ? _mobileLayout(context, isDark)
                    : _desktopLayout(context, isDark),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _desktopLayout(
      BuildContext context, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Certificate Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            certificate.assetPath,
            width: 260,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 24),

        /// Details
        Expanded(
          child: _certificateDetails(context, isDark),
        ),
      ],
    );
  }

  Widget _mobileLayout(
      BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            certificate.assetPath,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 18),

        _certificateDetails(context, isDark),
      ],
    );
  }

  Widget _certificateDetails(
      BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          certificate.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          '${certificate.platform} • ${certificate.year}',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade500,
          ),
        ),

        const SizedBox(height: 16),

        _infoRow('Instructor', certificate.instructor),
        const SizedBox(height: 8),
        _infoRow('Duration', certificate.duration),

        const SizedBox(height: 24),

        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber.shade700,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => Dialog(
                child: InteractiveViewer(
                  child: Image.asset(
                    certificate.assetPath,
                  ),
                ),
              ),
            );
          },
          icon: const Icon(Icons.visibility),
          label: const Text('View Certificate'),
        ),
      ],
    );
  }

  Widget _infoRow(String title, String value) {
    return Row(
      children: [
        Text(
          '$title: ',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(value),
        ),
      ],
    );
  }
}