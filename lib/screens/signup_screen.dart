import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool showBanner = false;

  void _signup() async {
    if (passwordController.text != confirmPasswordController.text) {
      _showError('비밀번호가 일치하지 않습니다');
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      setState(() => showBanner = true);

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      });
    } on FirebaseAuthException catch (e) {
      String message = '회원가입 실패';
      if (e.code == 'email-already-in-use') {
        message = '이미 사용 중인 이메일입니다';
      } else if (e.code == 'weak-password') {
        message = '비밀번호는 6자 이상이어야 합니다';
      }
      _showError(message);
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (_) =>
          AlertDialog(
            content: Text(message),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context),
                  child: const Text('확인')),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF009EE2),
      body: SafeArea(
        child: Column(
          children: [
            // 🔽 ← 이전 버튼 (SafeArea 안에서 확실히 보이게)
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context); // ✅ 작동
                },
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      '회원가입',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: '이메일',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: '비밀번호',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: '비밀번호 확인',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _signup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,             // 흰 배경
                        foregroundColor: const Color(0xFF009EE2), // 파란 글씨
                        minimumSize: const Size(double.infinity, 50), // 가로 전체 너비
                        shape: RoundedRectangleBorder(             // 둥근 버튼
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('회원가입'),
                    ),
                    const SizedBox(height: 20),
                    if (showBanner)
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          '✅ 회원가입 되었습니다!',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
