import 'package:flutter/material.dart';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

import 'constants/theme.dart';
import 'pages/dashboard_page.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba Técnica clinica San Rafael',
      home: const DashboardPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeConstants().ligthTheme,
      darkTheme: ThemeConstants().darkTheme,
      themeMode: EasyDynamicTheme.of(context).themeMode,
    );
  }
}