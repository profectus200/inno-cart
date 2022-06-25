import 'package:flutter/material.dart';
import 'package:innocart_front/internal/dependencies/auth_repo_module.dart';
import 'package:innocart_front/internal/dependencies/profile_repo_module.dart';

import '../../domain/model/profile.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}
Color colors = Color(0xfffe9721);


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
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/auth.jpeg'), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xff161d27).withOpacity(0.9),
                  Color(0xff161d27),
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
                    Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Let's register. It's simple, just enter",
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: _usernameController,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          filled: true,
                          fillColor: Color(0xff161d27).withOpacity(0.9),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: colors)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: colors)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: _emailController,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          filled: true,
                          fillColor: Color(0xff161d27).withOpacity(0.9),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: colors)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: colors)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          filled: true,
                          fillColor: Color(0xff161d27).withOpacity(0.9),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: colors)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: colors)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 40, right: 40),
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
                        // style: TextButton.styleFrom(
                        //   backgroundColor: colors,
                        // ),
                        // color: colors,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(30),
                        // ),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already a user?",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
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
                    SizedBox(
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
    // return Container(
    //   decoration: const BoxDecoration(
    //     image: DecorationImage(
    //         image: AssetImage('./assets/auth.jpeg'), fit: BoxFit.cover),
    //   ),
    //   child: Scaffold(
    //     backgroundColor: Colors.transparent,
    //     appBar: AppBar(
    //       backgroundColor: Colors.transparent,
    //       elevation: 0,
    //     ),
    //     body: Stack(
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.only(left: 35, top: 30),
    //           child: const Text(
    //             'Create\nAccount',
    //             style: TextStyle(color: Colors.white, fontSize: 33),
    //           ),
    //         ),
    //         SingleChildScrollView(
    //           child: Container(
    //             padding: EdgeInsets.only(
    //                 top: MediaQuery.of(context).size.height * 0.28),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Container(
    //                   margin: const EdgeInsets.only(left: 35, right: 35),
    //                   child: Column(
    //                     children: [
    //                       TextField(
    //                         controller: _usernameController,
    //                         style: const TextStyle(color: Colors.black),
    //                         decoration: InputDecoration(
    //                             fillColor: Colors.grey.shade100,
    //                             filled: true,
    //                             enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(10),
    //                               borderSide: const BorderSide(
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                             focusedBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(10),
    //                               borderSide: const BorderSide(
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                             hintText: "Name",
    //                             border: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(10),
    //                             )),
    //                       ),
    //                       const SizedBox(
    //                         height: 30,
    //                       ),
    //                       TextField(
    //                         controller: _emailController,
    //                         style: const TextStyle(color: Colors.black),
    //                         decoration: InputDecoration(
    //                             fillColor: Colors.grey.shade100,
    //                             filled: true,
    //                             enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(10),
    //                               borderSide: const BorderSide(
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                             focusedBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(10),
    //                               borderSide: const BorderSide(
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                             hintText: "Email",
    //                             border: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(10),
    //                             )),
    //                       ),
    //                       const SizedBox(
    //                         height: 30,
    //                       ),
    //                       TextField(
    //                         controller: _passwordController,
    //                         style: const TextStyle(color: Colors.black),
    //                         obscureText: true,
    //                         decoration: InputDecoration(
    //                             fillColor: Colors.grey.shade100,
    //                             filled: true,
    //                             enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(10),
    //                               borderSide: const BorderSide(
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                             focusedBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(10),
    //                               borderSide: const BorderSide(
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                             hintText: "Password",
    //                             border: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(10),
    //                             )),
    //                       ),
    //                       const SizedBox(
    //                         height: 40,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           const Text(
    //                             'Sign Up',
    //                             style: TextStyle(
    //                                 color: Colors.white,
    //                                 fontSize: 27,
    //                                 fontWeight: FontWeight.w700),
    //                           ),
    //                           CircleAvatar(
    //                             radius: 30,
    //                             backgroundColor: const Color(0xff4c505b),
    //                             child: IconButton(
    //                                 color: Colors.white,
    //                                 onPressed: () {
    //                                   var username = _usernameController.text;
    //                                   var password = _passwordController.text;
    //                                   var email = _emailController.text;
    //
    //                                   AuthRepoModule.authRepository()
    //                                       .attemptSignUp(
    //                                           email, username, password)
    //                                       .then((value) {
    //                                     if (value == 201) {
    //                                       Profile profile = Profile(
    //                                           rating: 5,
    //                                           nickname: username,
    //                                           dealsCompleted: 0,
    //                                           id: -1);
    //                                       ProfileRepoModule.profileRepository()
    //                                           .addProfile(profile);
    //                                       Navigator.pushNamed(context, 'login');
    //                                     }
    //                                   });
    //                                   Navigator.pushNamed(context, 'register');
    //                                 },
    //                                 icon: const Icon(
    //                                   Icons.arrow_forward,
    //                                 )),
    //                           )
    //                         ],
    //                       ),
    //                       const SizedBox(
    //                         height: 40,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           TextButton(
    //                             onPressed: () {
    //                               Navigator.pushNamed(context, 'login');
    //                             },
    //                             style: const ButtonStyle(),
    //                             child: const Center(
    //                               child: Text(
    //                                 'Sign In',
    //                                 textAlign: TextAlign.center,
    //                                 style: TextStyle(
    //                                     decoration: TextDecoration.underline,
    //                                     color: Colors.white,
    //                                     fontSize: 18),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       )
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
