import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
          _buildBlobDecoration(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 120),
                  _buildTitle(),
                  const SizedBox(height: 48),
                  _buildEmailField(),
                  const SizedBox(height: 24),
                  _buildPasswordField(),
                  const SizedBox(height: 48),
                  _buildLoginButton(),
                  const Spacer(),
                  _buildSignUpText(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Blob cam góc trên ──────────────────────────────
  Widget _buildBlobDecoration() {
    return Positioned(
      top: -30,
      right: -30,
      child: Container(
        width: 180,
        height: 180,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFB347), Color(0xFFFF8C00)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(150),
            bottomRight: Radius.circular(60),
          ),
        ),
      ),
    );
  }

  // ── Title ──────────────────────────────────────────
  Widget _buildTitle() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Please sign in to continue.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // ── Email Field ────────────────────────────────────
  Widget _buildEmailField() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'EMAIL',
        labelStyle: const TextStyle(
          fontSize: 11,
          letterSpacing: 1.2,
          color: Colors.grey,
        ),
        prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ── Password Field ─────────────────────────────────
  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'PASSWORD',
        labelStyle: const TextStyle(
          fontSize: 11,
          letterSpacing: 1.2,
          color: Colors.grey,
        ),
        prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
        suffixIcon: TextButton(
          onPressed: () {}, // TODO: handle forgot password
          child: const Text(
            'FORGOT',
            style: TextStyle(
              color: Color(0xFFFF8C00),
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ── Login Button ───────────────────────────────────
  Widget _buildLoginButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          // TODO: handle login
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFFB347), Color(0xFFFF8C00)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF8C00).withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Colors.white, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  // ── Sign Up Text ───────────────────────────────────
  Widget _buildSignUpText() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have an account? ",
            style: TextStyle(color: Colors.grey),
          ),
          GestureDetector(
            onTap: () {
              // TODO: navigate to register screen
            },
            child: const Text(
              'Sign up',
              style: TextStyle(
                color: Color(0xFFFF8C00),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}