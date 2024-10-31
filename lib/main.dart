import 'package:crm_ui/pages/home_page.dart';
import 'package:crm_ui/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CrmUiApp());
}

class CrmUiApp extends StatelessWidget {
  const CrmUiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: LoginFormPage(),
        body: HomePage(email: 'Admin', password: 'admin'),
      ),
    );
  }
}
