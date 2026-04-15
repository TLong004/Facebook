import 'package:facebook/utils/validators.dart';
import 'package:facebook/view_models/auth_view_model.dart';
import 'package:facebook/widgets/custom_tf.dart';
import 'package:facebook/widgets/direct_txt.dart';
import 'package:facebook/widgets/orange_blob.dart';
import 'package:facebook/widgets/orange_btn.dart';
import 'package:facebook/widgets/wellcome_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Validators validators = Validators();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                      title: 'Login',
                      subtitle: 'Please sign in to continue.',
                    ),
                    const SizedBox(height: 48),
                    CustomTextField(
                      label: "EMAIL",
                      icon: Icons.email_outlined,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.email,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      label: 'PASSWORD',
                      icon: Icons.lock_outline,
                      controller: _passwordController,
                      validator: Validators.password,
                      obscureText: true,
                      suffix: TextButton(
                        onPressed: () {},
                        child: Text(
                          'FORGOT',
                          style: TextStyle(
                            color: Color(0xFFFF8C00),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Consumer<AuthViewModel>(
                      builder: (context, vm, child) {
                        return vm.isLoading
                            ? const CircularProgressIndicator()
                            : OrangeBtn(
                                text: 'LOGIN',
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final vm = context.read<AuthViewModel>();
                                    final success = await vm.login(
                                      _emailController.text.trim(),
                                      _passwordController.text.trim(),
                                    );

                                    if (success) {
                                      Navigator.pushNamed(context, '/home');
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
                      prompt: "Don't have a account?",
                      actionText: "Sign up",
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
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
