import 'package:flutter/material.dart';
import 'package:rfid/pages/register_screen.dart';
import 'package:rfid/pages/home_screen.dart';
import 'package:rfid/pages/ProcurementApp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        text: "RFID ",
                        style: TextStyle(color: Colors.black87),
                      ),
                      TextSpan(
                        text: "Inventory",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: " App",
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
                        "SIGN IN",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Email Field
                      _buildInputField(
                        label: "Email",
                        icon: Icons.email_outlined,
                      ),

                      const SizedBox(height: 28),

                      // Password Field
                      _buildInputField(
                        label: "Password",
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),

                      const SizedBox(height: 20),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sign in as",
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

                      const SizedBox(height: 5),

                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            activeColor: Colors.amberAccent,
                            onChanged: (value) {},
                          ),
                          const Text(
                            "Keep me signed in",
                            style: TextStyle(
                              color: Color.fromRGBO(2, 1, 1, 1),
                              fontSize: 18,
                            ),
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
                            final destination = _selectedRole == 'Procurement'
                                ? const ProcurementDashboard()
                                : const HomeScreen();

                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => destination,
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text(
                            "SIGN IN",
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
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigate to Register Screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Register",
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
