import 'package:facebook/widgets/custom_tf.dart';
import 'package:facebook/widgets/direct_txt.dart';
import 'package:facebook/widgets/orange_blob.dart';
import 'package:facebook/widgets/orange_btn.dart';
import 'package:facebook/widgets/wellcome_title.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E8),
      body: Stack(
        children: [
          const OrangeBlob(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 120),
                  WellcomeTitle(
                    title: "Create Account",
                    subtitle:
                        "Please fill in the details to create your account",
                  ),
                  const SizedBox(height: 48),
                  CustomTextField(
                    label: "FULL NAME",
                    icon: Icons.person_outline,
                    controller: _fullNameController,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: "EMAIL",
                    icon: Icons.email_outlined,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: "PASSWORD",
                    icon: Icons.lock_outline,
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: "CONFIRM PASSWORD",
                    icon: Icons.lock_outline,
                    controller: _confirmPasswordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 48),
                  OrangeBtn(
                    text: 'SIGN UP',
                    onPressed: () {
                      // TODO: Handle registration
                    },
                  ),
                  const Spacer(),
                  DirectTxt(
                    prompt: "Already have a account?",
                    actionText: "Sign in",
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
