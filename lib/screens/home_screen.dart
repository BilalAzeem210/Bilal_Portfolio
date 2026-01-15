import 'package:bilal_portfolio/widgets/education_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/keyboard_scroll_provider.dart';
import '../providers/project_provider.dart';
import '../utils/download_helper.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/about_section.dart';
import '../widgets/project_section.dart';
import '../widgets/skill_section.dart';
import '../widgets/certifications_section.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey certificationsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();


  Future<void> scrollToKey(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: 0.0,
    );
  }

  void onNavTap(String id) {
    switch (id) {
      case 'home':
        _scrollController.animateTo(0,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut);
        break;
      case 'about':
        scrollToKey(aboutKey);
        break;
      case 'skills':
        scrollToKey(skillsKey);
        break;
      case 'education':
        scrollToKey(educationKey);
        break;
      case 'certifications':
        scrollToKey(certificationsKey);
        break;
      case 'projects':
        scrollToKey(projectsKey);
        break;
      case 'contact':
        scrollToKey(contactKey);
        break;
    }
  }




  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectProv = Provider.of<ProjectProvider>(context);
    context.read<KeyboardScrollProvider>().attach(_scrollController);
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
          context.read<KeyboardScrollProvider>().down();
        }
        if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
          context.read<KeyboardScrollProvider>().up();
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(72),
            child: Header(onNavTap: onNavTap),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 700;
              bool isTablet =
                  constraints.maxWidth >= 700 && constraints.maxWidth < 1100;
      
              double titleFontSize = isMobile ? 24 : isTablet ? 28 : 32;
              double descFontSize = isMobile ? 14 : 16;
              double sectionSpacing = isMobile ? 14 : 20;
              double horizontalPadding = isMobile ? 12 : 20;
      
              return SingleChildScrollView(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: 24),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: sectionSpacing),
                        Text(
                          'Hi, I\'m Bilal Azeem 👋',
                          style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: sectionSpacing),
                        Text(
                          'Flutter Developer crafting cross-platform apps that fuse modern design, AI innovation, and robust architecture.',
                          style: TextStyle(fontSize: descFontSize),
                        ),
                        SizedBox(height: sectionSpacing * 1.2),
      
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow.shade700,
                          ),
                          onPressed: () => downloadCV(context),
                          child: const Text(
                            'Download CV',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
      
                        SizedBox(height: sectionSpacing * 1.2),
      
                        // About
                       Container(
                                  key: aboutKey,
                                  child: const AboutSection()
                              ),
      
      
      
                        SizedBox(height: sectionSpacing),
      
                        // Skills
                         Container(
                                  key: skillsKey,
                                  child: const SkillsSection()
                              ),
      
      
      
                        SizedBox(height: sectionSpacing),
      
                        // Education
                          Container(
                                key: educationKey,
                                child: const EducationSection()
                            ),
      
      
      
                        SizedBox(height: sectionSpacing),
      
                        // Certifications
                         Container(
                              key: certificationsKey,
                              child: CertificationsSection(
                                certificate: CertificateItem(
                                  title: 'Flutter Development',
                                  assetPath: 'assets/images/BilalCertificate.jpg',
                                ),
                              ),
                            ),
      
      
      
                        SizedBox(height: sectionSpacing),
      
                        // Projects
                         Container(
                             key: projectsKey,
                             child:
                             ProjectsSection(projects: projectProv.projects)
                                               ),
      
      
      
                        SizedBox(height: sectionSpacing),
      
                        // Contact
                        Container(key: contactKey, child: const Footer()),
      
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
