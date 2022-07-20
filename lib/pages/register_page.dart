import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pdp_prefdemo/model/account_model.dart';
import 'package:pdp_prefdemo/pages/login_page.dart';
import 'package:pdp_prefdemo/pages/widgets/toast.dart';

import '../services/pref_service.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register_page';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordCController;
  late FToast fToast;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordCController = TextEditingController();
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    bool isNotFilled = _usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _passwordCController.text.isNotEmpty;
    bool isAllNotFilled = _usernameController.text.isNotEmpty ||
        _emailController.text.isNotEmpty ||
        _phoneController.text.isNotEmpty ||
        _passwordController.text.isNotEmpty ||
        _passwordCController.text.isNotEmpty;
    if (isNotFilled) {
      if (_passwordController.text != _passwordCController.text) {
        showToast(title: "Passwords are not same!", fToast: fToast);
      } else {
        Prefs.storeAccount(
          Account(
            id: math.Random().nextInt(100).toString(),
            username: _usernameController.text,
            email: _emailController.text,
            phone: _phoneController.text,
            password: _passwordController.text,
          ),
        );
        showToast(title: "Success", fToast: fToast, color: Colors.greenAccent);
      }
    } else {
      if (!isAllNotFilled) {
        showToast(title: "Please Fill all fields!", fToast: fToast);
      } else {
        List<String> fields = [];
        if (_usernameController.text.isEmpty) fields.add("Username");

        if (_emailController.text.isEmpty) fields.add("Email");

        if (_phoneController.text.isEmpty) fields.add("Phone");

        if (_passwordController.text.isEmpty) fields.add("Password");
        if (_passwordCController.text.isEmpty) fields.add("Confirm Password");
        if (fields.isNotEmpty) showToast(title: "Please Fill the ${fields.join(', ')} field!", fToast: fToast);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: w,
          height: h,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 7),
                const Text(
                  "Let's Get Started!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                    fontFamily: "sans-serif",
                  ),
                ),
                const Spacer(flex: 1),
                const Text(
                  "Create an account to Q Allure to get all features",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: "sans-serif",
                  ),
                ),
                const Spacer(flex: 3),
                // #usernameInput
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: 65,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        spreadRadius: 9,
                        blurRadius: 29,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      icon: const Icon(
                        CupertinoIcons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                // #emailInput
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: 65,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        spreadRadius: 9,
                        blurRadius: 29,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      icon: const Icon(
                        CupertinoIcons.mail,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                // #phoneInput
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: 65,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        spreadRadius: 9,
                        blurRadius: 29,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      icon: const Icon(
                        CupertinoIcons.device_phone_portrait,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                // #passwordInput
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: 65,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        spreadRadius: 9,
                        blurRadius: 29,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      icon: const Icon(
                        CupertinoIcons.lock,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                // #confirmPasswordInput
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: 65,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        spreadRadius: 9,
                        blurRadius: 29,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _passwordCController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      icon: const Icon(
                        CupertinoIcons.lock,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 2),

                // #signupBtn
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff1551ce).withOpacity(.3),
                          spreadRadius: 1,
                          blurRadius: 20,
                          offset: const Offset(0, 10)),
                    ],
                  ),
                  child: FlatButton(
                    onPressed: _login,
                    color: const Color(0xff1551ce),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 65),
                    child: const Text(
                      "Create",
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context, LoginPage.id, (route) => false);
                        },
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Already have an account?',
                                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                  text: " Login here",
                                  style: TextStyle(color: Color(0xff3F83FD), fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
