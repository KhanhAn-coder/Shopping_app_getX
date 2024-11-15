import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_getx/screens/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
  }
  
  Future<void> logIn() async{
    final res = await http.post(Uri.parse('https://dummyjson.com/auth/login'),
      headers: { 'Content-Type': 'application/json'},
      body: jsonEncode({
        'username' : emailController.text.trim(),
        'password' : passwordController.text.trim(),
        'expiresInMin' : 30,
      })
    );
    if(res.statusCode == 200){
      final result = jsonDecode(res.body);
      Get.to(HomeScreen(accessToken: result['accessToken'],));
    }else{
      ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(const SnackBar(content: Text('Login Failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 35.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Log into',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 10,),
              const Text('your account',
                style: TextStyle(
                    fontSize: 30,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 50,),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email address',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal
                  )
                ),
              ),
              const SizedBox(height: 40,),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Pasword',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal
                  )
                ),
              ),
              const SizedBox(height: 35,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: const Text('Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40,),
               Column(
                 children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                          onPressed: logIn,
                        color: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(40), right: Radius.circular(40)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric( horizontal: 30.0, vertical: 12),
                          child: Text('LOG IN',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ],
                   ),
                   const SizedBox(height: 20),
                   const Text('or log in with',
                     style: TextStyle(
                       color: Colors.grey
                     ),
                   )
                 ],
               ),
              const SizedBox(height: 20),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: size.width *0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Container(
                     height: 40,
                     width: 40,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       border: Border.all(
                         color: Colors.grey
                       ),
                       image: const DecorationImage(
                           image: AssetImage('assets/images/apple.png',),
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.grey
                        ),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/google.png',),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.grey
                        ),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/facebook.png',),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  Text(' Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
