import 'package:flutter/material.dart';
import 'package:rfid/pages/login_screen.dart';
import 'package:rfid/pages/home_screen.dart';
import 'package:rfid/pages/ProcurementApp.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _selectedRole = 'Storekeeper';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f7),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                    ),
                    children: [
                      TextSpan(
                        text: "Create ",
                        style: TextStyle(color: Colors.black87),
                      ),
                      TextSpan(
                        text: "an",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: " account",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                Container(
                  width: 340,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 35,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 237, 236, 231),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Username Field
                      _buildInputField(
                        label: "Username",
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 20),
                      // Email Field
                      _buildInputField(
                        label: "Email",
                        icon: Icons.email_outlined,
                      ),

                      const SizedBox(height: 20),

                      // Password Field
                      _buildInputField(
                        label: "Password",
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      // Confirm Password Field
                      _buildInputField(
                        label: "Confirm Password",
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),

                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Register as',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          RadioListTile<String>(
                            title: const Text('Storekeeper'),
                            value: 'Storekeeper',
                            groupValue: _selectedRole,
                            activeColor: Colors.amberAccent,
                            onChanged: (value) {
                              setState(() {
                                _selectedRole = value ?? 'Storekeeper';
                              });
                            },
                          ),
                          RadioListTile<String>(
                            title: const Text('Procurement'),
                            value: 'Procurement',
                            groupValue: _selectedRole,
                            activeColor: Colors.amberAccent,
                            onChanged: (value) {
                              setState(() {
                                _selectedRole = value ?? 'Storekeeper';
                              });
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text(
                            "Confirm Registration",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 20,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account? ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigate to Login Screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.amberAccent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.amberAccent, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.amberAccent, width: 2.5),
        ),
      ),
    );
  }
}
