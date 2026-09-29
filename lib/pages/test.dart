import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusLink',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String baseUrl = 'http://localhost/flutter_nelly_app/';
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('${baseUrl}get-users.php'));
    if (response.statusCode != 200) {
      throw Exception('Failed to load users from DB');
    }
    if (mounted) {
      setState(() {
        users = jsonDecode(response.body) as List<dynamic>;
      });
    }
  }

  Future<void> insertUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}insert-user.php'),
      body: {'email': email, 'password': password},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to insert user');
    }
    await fetchUsers();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CampusLink')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () => insertUser(
                _emailController.text,
                _passwordController.text,
              ),
              child: const Text('Insert User'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index] as Map<String, dynamic>;
                  return ListTile(
                    title: Text('${user['email']}'),
                    subtitle: Text('${user['password']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
