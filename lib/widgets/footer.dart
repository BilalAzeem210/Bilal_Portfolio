import 'package:bilal_portfolio/widgets/hover_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/hover_provider.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  final String linkedIn = 'https://www.linkedin.com/in/bilal-azeem-219337188/';
  final String github = 'https://github.com/BilalAzeem210';


  Future<void> _openUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openEmail() async {
    final uri = Uri.tryParse('mailto:biazeem210@gmail.com');
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (_) => HoverProvider(),
      child: HoverCard(
        shadowColor: Color(0xff00d9ca),
        child: Card(
          color: theme.cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Contact Us',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Have a project idea or want to collaborate?\nFeel free to reach out!',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: _openEmail,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade900, // 👈 Matches theme color
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '📧  biazeem210@gmail.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(color: theme.dividerColor.withOpacity(0.3)),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,

                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/github.png',height: 40,),
                        iconSize: 30,
                        tooltip: 'GitHub',
                        onPressed: () => _openUrl(github),
                      ),
                      IconButton(
                        icon: Image.asset('assets/images/link.png',height: 40,),
                        tooltip: 'LinkedIn',
                        onPressed: () => _openUrl(linkedIn),
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 8),

                Center(
                  child: Text(
                    'Build by: Bilal Azeem',
                    style: const TextStyle(fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
