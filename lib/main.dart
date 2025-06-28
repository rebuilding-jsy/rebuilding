// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';
import 'firebase_options.dart'; // Firebase 콘솔에서 설정 후 자동 생성되는 파일

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const RebuildingApp());
}

class RebuildingApp extends StatelessWidget {
  const RebuildingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '리빌딩',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
