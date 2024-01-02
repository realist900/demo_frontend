import 'package:demo_front/data/storage.dart';
import 'package:demo_front/dependency.dart';
import 'package:demo_front/feature/login/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Storage _storage = Dependency.storage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            IconButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                await _storage.clearUser();
                await _storage.clearTokens();
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'Name : ${_storage.getUser()!.name}',
              ),
              Text(
                'Email : ${_storage.getUser()!.email}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
