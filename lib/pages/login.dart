import 'package:flutter/material.dart';
import 'reg.dart';
import 'forgot_password.dart';
import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EBDD),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 30,
            ),

            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  // Logo
                  Container(
                    width: 58,
                    height: 58,

                    decoration: BoxDecoration(
                      color: const Color(0xFF7A1F3D),
                      borderRadius:
                          BorderRadius.circular(18),
                    ),

                    child: const Icon(
                      Icons.school_rounded,
                      color: Colors.white,
                      size: 31,
                    ),
                  ),

                  const SizedBox(height: 35),

                  // Heading
                  const Text(
                    'Welcome back.',
                    style: TextStyle(
                      color: Color(0xFF252525),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Log in to continue to CampusLink.',
                    style: TextStyle(
                      color: Color(0xFF6F6862),
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 35),

                  // Email
                  const Text(
                    'Email',
                    style: TextStyle(
                      color: Color(0xFF252525),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  TextField(
                    controller: emailController,
                    keyboardType:
                        TextInputType.emailAddress,

                    decoration: InputDecoration(
                      hintText: 'Enter your email',

                      hintStyle: const TextStyle(
                        color: Color(0xFF6F6862),
                      ),

                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Color(0xFF7A1F3D),
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),

                      focusedBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(
                          color: Color(0xFF7A1F3D),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Password
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Color(0xFF252525),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  TextField(
                    controller: passwordController,
                    obscureText: obscurePassword,

                    decoration: InputDecoration(
                      hintText: 'Enter your password',

                      hintStyle: const TextStyle(
                        color: Color(0xFF6F6862),
                      ),

                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: Color(0xFF7A1F3D),
                      ),

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword =
                                !obscurePassword;
                          });
                        },

                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,

                          color:
                              const Color(0xFF6F6862),
                        ),
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),

                      focusedBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(
                          color: Color(0xFF7A1F3D),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Forgot password
                  Align(
                    alignment:
                        Alignment.centerRight,

                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ForgotPasswordPage(),
                          ),
                        );
                      },

                      style: TextButton.styleFrom(
                        foregroundColor:
                            const Color(0xFF7A1F3D),
                        padding: EdgeInsets.zero,
                      ),

                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Login button
                  SizedBox(
                    width: double.infinity,
                    height: 56,

                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const DashboardPage(),
                          ),
                        );
                      },

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF7A1F3D),

                        foregroundColor:
                            Colors.white,

                        elevation: 0,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                      ),

                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Divider
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color:
                              Color(0xFFE8D8C3),
                        ),
                      ),

                      Padding(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 14,
                        ),

                        child: Text(
                          'New to CampusLink?',
                          style: TextStyle(
                            color:
                                const Color(
                                    0xFF6F6862),
                            fontSize: 13,
                          ),
                        ),
                      ),

                      const Expanded(
                        child: Divider(
                          color:
                              Color(0xFFE8D8C3),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // Create account
                  SizedBox(
                    width: double.infinity,
                    height: 56,

                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const RegistrationPage(),
                          ),
                        );
                      },

                      style:
                          OutlinedButton.styleFrom(
                        foregroundColor:
                            const Color(0xFF7A1F3D),

                        side: const BorderSide(
                          color:
                              Color(0xFF7A1F3D),
                          width: 1.5,
                        ),

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                      ),

                      child: const Text(
                        'Create an Account',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Center(
                    child: Text(
                      'CampusLink',
                      style: TextStyle(
                        color: Color(0xFF7A1F3D),
                        fontSize: 13,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}