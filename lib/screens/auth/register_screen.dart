import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_texts.dart';
import '../auth/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset(AppAssets.logo, height: 78.4, width: 54.28),
              const SizedBox(height: 28.6),

              Text(
                AppTexts.registerTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                AppTexts.registerSubtitle,
                style: const TextStyle(fontSize: 14),
              ),

              const SizedBox(height: 40),

              _buildTextField(
                controller: nameController,
                hintText: AppTexts.hintInputNameAndLastNameRegister,
                icon: Icons.person_outline,
              ),

              const SizedBox(height: 20),

              _buildTextField(
                controller: emailController,
                hintText: AppTexts.hintInputEmailRegister,
                icon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              _buildTextField(
                controller: passwordController,
                hintText: AppTexts.hintInputPasswordRegister,
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: 250,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    AppTexts.registerButton,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Text(
                  AppTexts.textButtonHaveAccount,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color.fromRGBO(196, 196, 196, 0.2),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: Icon(icon, color: const Color.fromRGBO(0, 0, 0, 0.3)),
      ),
    );
  }
}
