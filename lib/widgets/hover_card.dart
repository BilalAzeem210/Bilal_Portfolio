import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/hover_provider.dart';

class HoverCard extends StatelessWidget {
  final Widget child;
  final Color shadowColor;

  const HoverCard({
    super.key,
    required this.child,
    this.shadowColor = const Color(0xFF8E2DE2),
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Consumer<HoverProvider>(
      builder: (context, hoverProv, _) {
        final isHovered = hoverProv.isHovered;

        Widget card = AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          transform: isHovered
              ? (Matrix4.identity()
            ..translate(0.0, -8.0)
            ..scale(1.02))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? shadowColor.withAlpha(115)
                    : Colors.black.withAlpha(45),
                blurRadius: isHovered ? 28 : 12,
                spreadRadius: isHovered ? 2 : 0,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: child,
        );

        if (isDesktop) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => hoverProv.setHover(true),
            onExit: (_) => hoverProv.setHover(false),
            child: card,
          );
        } else {
          return GestureDetector(
            onTapDown: (_) => hoverProv.setHover(true),
            onTapUp: (_) => hoverProv.setHover(false),
            onTapCancel: () => hoverProv.setHover(false),
            child: card,
          );
        }
      },
    );
  }
}
