import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pdp_prefdemo/model/user_model.dart';
import 'package:pdp_prefdemo/pages/register_page.dart';
import 'package:pdp_prefdemo/pages/widgets/toast.dart';
import 'package:pdp_prefdemo/services/pref_service.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late FToast fToast;
  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
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
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      showToast(
        title: "Username and Password must be filled.",
        fToast: fToast,
      );
    } else {
      Prefs.storeUser(
        User(
          id: math.Random().nextInt(100).toString(),
          email: _usernameController.text,
          password: _passwordController.text,
        ),
      );
      showToast(title: "Success", fToast: fToast, color: Colors.greenAccent);
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: h * .05),
                SvgPicture.asset(
                  'assets/images/login_svg.svg',
                  height: h * .23,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Welcome back!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                    fontFamily: "sans-serif",
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Log in to your existent account of Q Allure",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: "sans-serif",
                  ),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 15),
                // #forgetPassword
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                // #loginBTN
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff1346A4).withOpacity(.3),
                          spreadRadius: 1,
                          blurRadius: 20,
                          offset: const Offset(0, 10)),
                    ],
                  ),
                  child: FlatButton(
                    onPressed: _login,
                    color: const Color(0xff1346A4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 65),
                    child: const Text(
                      "LOG IN",
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),

                const SizedBox(height: 35),
                const Text(
                  "Or connect using",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: "sans-serif",
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () {},
                      color: const Color(0xff375b8e),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                      child: const Text(
                        "Facebook",
                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(width: 15),
                    FlatButton(
                      onPressed: () {},
                      color: const Color(0xffeb4237),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                      child: const Text(
                        "Google",
                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context, RegisterPage.id, (route) => false);
                        },
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don\'t have an account?',
                                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                  text: " Sign Up",
                                  style: TextStyle(color: Color(0xff3F83FD), fontWeight: FontWeight.w600)),
                            ],
                          ),
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
}
