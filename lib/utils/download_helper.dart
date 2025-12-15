import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/pdf_viewer_screen.dart';

Future<void> downloadCV(BuildContext context) async {
  const cvUrl = 'BilalAzeem.pdf';

  if (kIsWeb) {

    final Uri url = Uri.parse(cvUrl);
    if (!await launchUrl(url, webOnlyWindowName: '_blank')) {
      throw 'Could not open $cvUrl';
    }
  } else {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const PDFViewerScreen(
          assetPath: "assets/images/BilalAzeem.pdf",
        ),
      ),
    );
  }
}
