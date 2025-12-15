import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:universal_html/html.dart' as html;

class PDFViewerScreen extends StatelessWidget {
  final String assetPath;
  const PDFViewerScreen({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // On web, open directly from web root
      html.window.open('BilalAzeem.pdf', '_blank');
      Navigator.pop(context);
      return const Scaffold(
        body: Center(child: Text('Opening PDF...')),
      );
    } else {
      // On mobile, show the PDF from assets
      return Scaffold(
        appBar: AppBar(
          title: const Text('Bilal Azeem - CV'),
          centerTitle: true,
        ),
        body: SfPdfViewer.asset(assetPath),
      );
    }
  }
}
