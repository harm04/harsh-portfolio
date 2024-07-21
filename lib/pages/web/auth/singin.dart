import 'package:flutter/material.dart';
import 'package:harsh_profile/pages/admin/admin_panel.dart';
import 'package:harsh_profile/pages/web/auth/signup.dart';
import 'package:harsh_profile/services/auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return isloading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: Padding(
              padding: MediaQuery.of(context).size.width > 600
                  ? EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 2.8)
                  : const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const SignUpPage();
                              }));
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isloading = true;
                        });
                        String res = await AuthServices().signin(
                            emailController.text, passwordController.text);
                        if (res == 'success') {
                          setState(() {
                            isloading = false;
                          });
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const AdminPanel();
                          }));
                        } else {
                          isloading = false;
                        }
                      },
                      child: const Card(
                        color: Colors.blueAccent,
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: Center(
                            child: Text('Sign in'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
