import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/project_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        Provider(create: (_) => ProjectProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProv, _) {
        return MaterialApp(
          title: 'Bilal Azeem',
          debugShowCheckedModeBanner: false,
          theme: themeProv.lightTheme,
          darkTheme: themeProv.darkTheme,
          themeMode: themeProv.themeMode,
          home: const HomeScreen(),
        );
      },
    );
  }
}
