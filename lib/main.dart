import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 가로 고정
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // flutterfire configure로 생성된 파일
import 'screens/login_screen.dart'; // 시작 화면

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ 가로 방향만 허용
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // ✅ Firebase 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '야구 시뮬레이터',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard', // 선택사항
      ),
      home: const LoginScreen(), // 앱 시작 시 로그인 화면
    );
  }
}
