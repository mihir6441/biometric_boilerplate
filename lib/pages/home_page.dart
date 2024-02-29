import 'package:biometric_demo/main.dart';
import 'package:biometric_demo/pages/notice_dialog_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Home',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 48),
              buildLogoutButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLogoutButton(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50),
    ),
    child: const Text(
      'Logout',
      style: TextStyle(fontSize: 20),
    ),
    onPressed: () => Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const NoticeDialogBox()),
    ),
  );

}
