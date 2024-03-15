import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Prueba Técnica clinica San Rafael'),
      ),
      body: const Center(
        child: Text('Dashboard Page'),
      ),
    );
  }
}