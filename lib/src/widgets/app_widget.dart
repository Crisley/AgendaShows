import 'package:flutter/material.dart';

import '../views/shows_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Agenda Integrantes de Nárnia",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const ShowsPage(),
    );
  }
}
