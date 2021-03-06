import 'package:flutter/material.dart';

import 'pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "WooCommerce App",
        debugShowCheckedModeBanner: false,
        home: SignupPage());
  }
}
