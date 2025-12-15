import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/theme_provider.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String id) onNavTap;
  const Header({super.key, required this.onNavTap});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final themeProv = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth >= 800;

    final navItems = [
      {'id': 'home', 'label': 'Home'},
      {'id': 'about', 'label': 'About'},
      {'id': 'skills', 'label': 'Skills'},
      {'id': 'education', 'label': 'Education'},
      {'id': 'certifications', 'label': 'Certifications'},
      {'id': 'projects', 'label': 'Projects'},
      {'id': 'contact', 'label': 'Contact'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// 🟣 Left: Logo
          Row(
            children: [
              Image.asset(
                'assets/images/bilallogo.png',
                height: 42,
              ),
            ],
          ),


          if (isWide)
          // 🖥️ Desktop / Tablet Navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var item in navItems)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextButton(
                      onPressed: () => onNavTap(item['id']!),
                      child: Text(
                        item['label']!,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(width: 20),
                IconButton(
                  tooltip: 'Toggle Theme',
                  onPressed: () => themeProv.toggleTheme(),
                  icon: Icon(
                    themeProv.isLight
                        ? Icons.wb_sunny_rounded
                        : Icons.dark_mode_rounded,
                  ),
                ),
              ],
            )
          else
          // 📱 Mobile Navigation (Theme Button outside menu)
            Row(
              children: [
                IconButton(
                  tooltip: 'Toggle Theme',
                  onPressed: () => themeProv.toggleTheme(),
                  icon: Icon(
                    themeProv.isLight
                        ? Icons.wb_sunny_rounded
                        : Icons.dark_mode_rounded,
                  ),
                ),
                PopupMenuButton<String>(
                  tooltip: 'Menu',
                  icon: const Icon(Icons.menu),
                  onSelected: (id) => onNavTap(id),
                  itemBuilder: (_) => [
                    for (var item in navItems)
                      PopupMenuItem(
                        value: item['id']!,
                        child: Text(item['label']!),
                      ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
