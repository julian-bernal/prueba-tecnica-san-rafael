import 'package:flutter/material.dart';

import 'pages/dashboard_page.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Prueba Técnica clinica San Rafael',
      home: DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}