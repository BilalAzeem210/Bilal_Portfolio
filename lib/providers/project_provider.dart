import '../models/project_model.dart';


class ProjectProvider {
  final List<Project> projects = [
    Project(
      title: 'CP Sales Tracker (Pharma)',
      description:
      'CP Sales Tracker is an easy-to-use mobile app designed for the pharmaceutical industry. Register, create tasks, track & bookmark locations, and check in/out. Admins can assign tasks and review reports. Built with Flutter; available on Play Store.',
      imageAsset: 'assets/images/cpbanner.png',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.sc.sc_pharma_app&hl=en_US',
      repoUrl: '',
    ),
    Project(
      title: 'NewsApp (News App)',
      description:
      'Modern news app built with Flutter. Integrates News API for real-time updates. Uses Provider for state management. Browse categories, read full articles, and enjoy a smooth experience.',
      imageAsset: 'assets/images/newport.png',
      repoUrl: '',
      playStoreUrl: '',
    ),
    Project(
      title: 'UI Experiments & Screenshots',
      description: 'Extra UI experiments and designs for mobile layouts and widgets.',
      imageAsset: 'assets/images/screenshot3.jpg',
      playStoreUrl: '',
      repoUrl: '',
    ),
    Project(
      title: 'CP Sales Tracker (Pharma)',
      description:
      'CP Sales Tracker is an easy-to-use mobile app designed for the pharmaceutical industry. Register, create tasks, track & bookmark locations, and check in/out. Admins can assign tasks and review reports. Built with Flutter; available on Play Store.',
      imageAsset: 'assets/images/screenshot1.jpg',
      playStoreUrl: '',
      repoUrl: '',
    ),
    Project(
      title: 'NewsApp (News App)',
      description:
      'Modern news app built with Flutter. Integrates News API for real-time updates. Uses Provider for state management. Browse categories, read full articles, and enjoy a smooth experience.',
      imageAsset: 'assets/images/screenshot2.jpg',
      playStoreUrl: '',
      repoUrl: '',
    ),
    Project(
      title: 'UI Experiments & Screenshots',
      description: 'Extra UI experiments and designs for mobile layouts and widgets.',
      imageAsset: 'assets/images/screenshot3.jpg',
      playStoreUrl: '',
      repoUrl: '',
    ),
  ];
}
