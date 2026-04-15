import 'package:facebook/utils/validators.dart';
import 'package:facebook/view_models/auth_view_model.dart';
import 'package:facebook/widgets/custom_tf.dart';
import 'package:facebook/widgets/direct_txt.dart';
import 'package:facebook/widgets/orange_blob.dart';
import 'package:facebook/widgets/orange_btn.dart';
import 'package:facebook/widgets/wellcome_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final _formKey = GlobalKey<FormState>();
  final Validators validators = Validators();

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
              child: Form(
                key: _formKey,
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
                      validator: Validators.fullName,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      label: "EMAIL",
                      icon: Icons.email_outlined,
                      controller: _emailController,
                      validator: Validators.email,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      label: "PASSWORD",
                      icon: Icons.lock_outline,
                      controller: _passwordController,
                      obscureText: true,
                      validator: Validators.password,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      label: "CONFIRM PASSWORD",
                      icon: Icons.lock_outline,
                      controller: _confirmPasswordController,
                      obscureText: true,
                      validator: (value) => Validators.confirmPassword(
                        value,
                        _passwordController.text,
                      ),
                    ),
                    const SizedBox(height: 48),
                    Consumer<AuthViewModel>(
                      builder: (context, vm, child) {
                        return vm.isLoading
                            ? const CircularProgressIndicator()
                            : OrangeBtn(
                                text: 'SIGN UP',
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final vm = context.read<AuthViewModel>();
                                    final success = await vm.register(
                                      _emailController.text.trim(),
                                      _passwordController.text.trim(),
                                    );

                                    if (success) {
                                      Navigator.pushNamed(context, '/login');
                                    } else {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            vm.errorMessage ?? 'Login failed',
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                              );
                      },
                    ),
                    const Spacer(),
                    DirectTxt(
                      prompt: "Already have a account?",
                      actionText: "Sign in",
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
