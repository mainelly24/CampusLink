import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  final fullnameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phonenumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final addressController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    fullnameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    phonenumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dateOfBirthController.dispose();
    addressController.dispose();
    super.dispose();
  }

  // Converts DD/MM/YYYY to YYYY-MM-DD for MySQL
  String? convertDateToMySQL(String date) {
    try {
      final parts = date.split('/');

      if (parts.length != 3) {
        return null;
      }

      final day = parts[0];
      final month = parts[1];
      final year = parts[2];

      if (day.length != 2 ||
          month.length != 2 ||
          year.length != 4) {
        return null;
      }

      return '$year-$month-$day';
    } catch (e) {
      return null;
    }
  }

  Future<void> registerUser() async {
    // Check that all fields are filled
    if (fullnameController.text.trim().isEmpty ||
        usernameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        phonenumberController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        dateOfBirthController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
        ),
      );
      return;
    }

    // Check passwords
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match.'),
        ),
      );
      return;
    }

    // Convert date
    final mysqlDate =
        convertDateToMySQL(dateOfBirthController.text.trim());

    if (mysqlDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter date as DD/MM/YYYY.'),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(
          'http://localhost/flutter_nelly_app/register.php',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'fullname': fullnameController.text.trim(),
          'username': usernameController.text.trim(),
          'email': emailController.text.trim(),
          'phonenumber': phonenumberController.text.trim(),
          'password': passwordController.text,
          'dateofbirth': mysqlDate,
          'address': addressController.text.trim(),
        }),
      );

      // Show the response in VS Code Debug Console
      debugPrint('STATUS CODE: ${response.statusCode}');
      debugPrint('SERVER RESPONSE: ${response.body}');

      if (!mounted) return;

      // Check HTTP status
      if (response.statusCode != 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Server error: ${response.statusCode}',
            ),
          ),
        );
        return;
      }

      // Try to decode JSON safely
      Map<String, dynamic> responseData;

      try {
        responseData = jsonDecode(response.body);
      } catch (e) {
        debugPrint('JSON ERROR: $e');
        debugPrint('RAW SERVER RESPONSE: ${response.body}');

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'The server returned an invalid response. Check the Debug Console.',
            ),
          ),
        );
        return;
      }

      // Registration successful
      if (responseData['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              responseData['message'] ?? 'Registration successful!',
            ),
          ),
        );

        // Clear the form
        fullnameController.clear();
        usernameController.clear();
        emailController.clear();
        phonenumberController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        dateOfBirthController.clear();
        addressController.clear();
      } else {
        // Registration failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              responseData['message'] ?? 'Registration failed.',
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      debugPrint('CONNECTION ERROR: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Could not connect to the server: $e',
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: fullnameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: phonenumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: dateOfBirthController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                hintText: 'DD/MM/YYYY',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: addressController,
              keyboardType: TextInputType.streetAddress,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : registerUser,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}