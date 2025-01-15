import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transvity/views/trending_repos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Github Trending Repos',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: TrendingReposScreen(),
    );
  }
}
