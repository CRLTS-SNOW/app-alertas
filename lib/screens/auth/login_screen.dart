import 'package:app_alerta/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_texts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                const SizedBox(height: 58),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: AppTexts.hintInputEmailLogin,
                    hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
                    filled: true,
                    fillColor: Color.fromRGBO(196, 196, 196, 0.2),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Icon(
                      Icons.mail_outline,
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: AppTexts.hintInputEmailLogin,
                    hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
                    filled: true,
                    fillColor: Color.fromRGBO(196, 196, 196, 0.2),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Icon(
                      Icons.lock_outline,
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),
                    Text(AppTexts.checkboxRememberLogin),

                    const Spacer(),

                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        AppTexts.textButtonForgotPassword,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppTexts.loginDontHaveAccount,
                      style: TextStyle(color: AppColors.overlay),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        AppTexts.loginRegisterLink,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                SizedBox(
                  width: 250,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    child: Text(
                      AppTexts.loginButton,
                      style: TextStyle(
                        color: AppColors.scaffoldBackground,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
