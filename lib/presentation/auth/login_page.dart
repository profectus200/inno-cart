import 'package:flutter/material.dart';
import 'package:innocart_front/internal/dependencies/auth_repo_module.dart';
import 'package:innocart_front/presentation/extra/app_colors.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}
Color colors = Color(0xfffe9721);

class _MyLoginState extends State<MyLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "InnoCart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Time to buy, let's Sign in",
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
                  height: 12,
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
                  height: 12,
                ),
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: colors, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    onPressed: () {
                      var username = _usernameController.text;
                      var password = _passwordController.text;
                      AuthRepoModule.authRepository()
                          .attemptLogIn(username, password)
                          .then((value) {
                        if (value == 200) {
                          Navigator.pushNamed(
                              context, 'dashboard');
                        }
                      });
                      Navigator.pushNamed(context, 'login');
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
                      "SIGN IN",
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
                      "It's your first time here?",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      child: Text(
                        "Sign up",
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
          ),
        ],
      ),
    );
  }
  }
  //   return Container(
  //     decoration: const BoxDecoration(
  //       image: DecorationImage(
  //           image: AssetImage('./assets/auth.jpeg'), fit: BoxFit.cover),
  //     ),
  //     child: Scaffold(
  //       backgroundColor: Colors.transparent,
  //       body: Stack(
  //         children: [
  //           Container(),
  //           Container(
  //             padding: const EdgeInsets.only(top: 130),
  //             child: const Align(
  //               alignment: Alignment.topCenter,
  //               child: Text(
  //                 'Welcome\nBack',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(color: Colors.white, fontSize: 33),
  //               ),
  //             ),
  //           ),
  //           SingleChildScrollView(
  //             child: Container(
  //               padding: EdgeInsets.only(
  //                   top: MediaQuery.of(context).size.height * 0.5),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Container(
  //                     margin: const EdgeInsets.only(left: 35, right: 35),
  //                     child: Column(
  //                       children: [
  //                         TextField(
  //                           controller: _usernameController,
  //                           style: const TextStyle(color: Colors.black),
  //                           decoration: InputDecoration(
  //                               fillColor: Colors.grey.shade100,
  //                               filled: true,
  //                               hintText: "Username",
  //                               border: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(10),
  //                               )),
  //                         ),
  //                         const SizedBox(
  //                           height: 30,
  //                         ),
  //                         TextField(
  //                           controller: _passwordController,
  //                           style: const TextStyle(),
  //                           obscureText: true,
  //                           decoration: InputDecoration(
  //                               fillColor: Colors.grey.shade100,
  //                               filled: true,
  //                               hintText: "Password",
  //                               border: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(10),
  //                               )),
  //                         ),
  //                         const SizedBox(
  //                           height: 40,
  //                         ),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             const Text(
  //                               'Sign in',
  //                               style: TextStyle(
  //                                   fontSize: 27,
  //                                   color: Colors.white,
  //                                   fontWeight: FontWeight.w700),
  //                             ),
  //                             CircleAvatar(
  //                               radius: 30,
  //                               backgroundColor: const Color(0xff4c505b),
  //                               child: IconButton(
  //                                   color: Colors.white,
  //                                   onPressed: () {
  //                                     var username = _usernameController.text;
  //                                     var password = _passwordController.text;
  //                                     AuthRepoModule.authRepository()
  //                                         .attemptLogIn(username, password)
  //                                         .then((value) {
  //                                       if (value == 200) {
  //                                         Navigator.pushNamed(
  //                                             context, 'dashboard');
  //                                       }
  //                                     });
  //                                     Navigator.pushNamed(context, 'login');
  //                                   },
  //                                   icon: const Icon(
  //                                     Icons.arrow_forward,
  //                                   )),
  //                             )
  //                           ],
  //                         ),
  //                         const SizedBox(
  //                           height: 40,
  //                         ),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             TextButton(
  //                               onPressed: () {
  //                                 Navigator.pushNamed(context, 'register');
  //                               },
  //                               style: const ButtonStyle(),
  //                               child: const Text(
  //                                 'Sign Up',
  //                                 textAlign: TextAlign.left,
  //                                 style: TextStyle(
  //                                     decoration: TextDecoration.underline,
  //                                     color: Colors.white,
  //                                     fontSize: 18),
  //                               ),
  //                             ),
  //                             TextButton(
  //                                 onPressed: () {},
  //                                 child: const Text(
  //                                   'Forgot Password',
  //                                   style: TextStyle(
  //                                     decoration: TextDecoration.underline,
  //                                     color: Colors.white,
  //                                     fontSize: 18,
  //                                   ),
  //                                 )),
  //                           ],
  //                         )
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
// }
