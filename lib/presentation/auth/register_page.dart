import 'package:flutter/material.dart';
import 'package:innocart_front/internal/dependencies/auth_repo_module.dart';
import 'package:innocart_front/internal/dependencies/profile_repo_module.dart';

import '../../domain/model/profile.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}
Color colors = const Color(0xfffe9721);


class _MyRegisterState extends State<MyRegister> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/auth.jpeg'), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.transparent,
                  const Color(0xff161d27).withOpacity(0.9),
                  const Color(0xff161d27),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Let's register. It's simple, just enter",
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: _usernameController,
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          filled: true,
                          fillColor: const Color(0xff161d27).withOpacity(0.9),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: colors)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: colors)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: _emailController,
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          filled: true,
                          fillColor: const Color(0xff161d27).withOpacity(0.9),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: colors)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: colors)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          filled: true,
                          fillColor: const Color(0xff161d27).withOpacity(0.9),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: colors)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: colors)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      child: TextButton(
                        onPressed: () {
                          var username = _usernameController.text;
                          var password = _passwordController.text;
                          var email = _emailController.text;

                          AuthRepoModule.authRepository()
                              .attemptSignUp(
                                  email, username, password)
                              .then((value) {
                            if (value == 201) {
                              Profile profile = Profile(
                                  rating: 5,
                                  nickname: username,
                                  dealsCompleted: 0,
                                  id: -1);
                              ProfileRepoModule.profileRepository()
                                  .addProfile(profile);
                              Navigator.pushNamed(context, 'login');
                            }
                          });
                          Navigator.pushNamed(context, 'register');
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(colors),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )
                            )
                        ),
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Already a user?",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: Text(
                            "Sign in",
                            style:
                            TextStyle(color: colors, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )],
            ),
          ),
        ],
      ),
    );
  }
}
