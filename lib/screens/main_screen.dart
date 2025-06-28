import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String username; // 로그인된 사용자명
  const MainScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> teams = [
      {'name': 'LG 트윈스', 'logo': 'assets/lg.png'},
      {'name': 'KT 위즈', 'logo': 'assets/kt.png'},
      {'name': 'SSG 랜더스', 'logo': 'assets/ssg.png'},
      {'name': 'NC 다이노스', 'logo': 'assets/nc.png'},
      {'name': 'KIA 타이거즈', 'logo': 'assets/kia.png'},
      {'name': '롯데 자이언츠', 'logo': 'assets/lotte.png'},
      {'name': '두산 베어스', 'logo': 'assets/doosan.png'},
      {'name': '삼성 라이온즈', 'logo': 'assets/samsung.png'},
      {'name': '한화 이글스', 'logo': 'assets/hanwha.png'},
      {'name': '키움 히어로즈', 'logo': 'assets/kiwoom.png'},
    ];

    String? selectedTeam;
    final ownerNameController = TextEditingController();
    final teamNameController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF009EE2),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/rebuilding_logo.png',
                  height: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  Text(
                    '환영합니다, $username 님!',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '야구 구단 선택',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    value: selectedTeam,
                    decoration: const InputDecoration(
                      labelText: '구단 선택',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    items: teams.map((team) {
                      return DropdownMenuItem<String>(
                        value: team['name'],
                        child: Row(
                          children: [
                            Image.asset(
                              team['logo']!,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 10),
                            Text(team['name']!),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedTeam = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: ownerNameController,
                    decoration: const InputDecoration(
                      labelText: '구단주 이름',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: teamNameController,
                    decoration: const InputDecoration(
                      labelText: '구단 이름',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedTeam == null ||
                          ownerNameController.text.isEmpty ||
                          teamNameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('모든 항목을 입력해주세요.')),
                        );
                        return;
                      }
                      // TODO: 다음 화면으로 이동 or 저장 로직
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF009EE2),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('다음'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}