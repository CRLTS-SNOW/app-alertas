import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_texts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(AppAssets.logo, height: 78.4, width: 54.28),
                const SizedBox(height: 28.6),
                Text(AppTexts.loginTitle, style: TextStyle(fontSize: 24)),
                Text(AppTexts.loginSubtitle, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
