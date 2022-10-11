import 'package:flutter/material.dart';

import 'login/bloc/login_provider.dart';
import 'login/view/login_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: const MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
