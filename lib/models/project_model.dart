class Project {
  final String title;
  final String description;
  final String imageAsset;
  final String playStoreUrl;
  final String repoUrl;

  Project({
    required this.title,
    required this.description,
    required this.imageAsset,
    this.playStoreUrl = 'https://play.google.com/store/apps/details?id=com.sc.sc_pharma_app&hl=en_US',
    this.repoUrl = 'https://github.com/BilalAzeem210?tab=repositories',
  });
}
