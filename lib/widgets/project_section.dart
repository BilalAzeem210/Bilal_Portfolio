import 'package:bilal_portfolio/widgets/hover_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project_model.dart';
import '../providers/hover_provider.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects;
  const ProjectsSection({super.key, required this.projects});

  Future<void> _openUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxis = width >= 1000 ? 3 : (width >= 700 ? 2 : 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Projects',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: projects.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxis,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.78,
          ),
          itemBuilder: (context, index) {
            final p = projects[index];
            return ChangeNotifierProvider(
              create: (_) => HoverProvider(),
              child: HoverCard(
                shadowColor: Color(0xff00d9ca),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Consistent Screenshot ---
                      AspectRatio(
                        aspectRatio: 16 / 10,
                        child: Image.asset(
                          p.imageAsset,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // --- Title ---
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          p.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      // --- Description ---
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          p.description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      // --- Play Store Button ---
                      if (p.playStoreUrl.isNotEmpty)
                        IconButton
                          (onPressed: () => _openUrl(p.playStoreUrl),
                            icon: Center(
                              child: Image.asset(
                                'assets/images/playstore2.png',
                                height: MediaQuery.of(context).size.height * 0.05, // ✅ Adjust icon size as you like
                              ),
                            ),)

                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
