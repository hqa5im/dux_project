import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 227, 236),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 428,
            height: 926,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  width: 428,
                  height: 926,
                  color: Colors.white.withOpacity(0.47),
                ),
                Positioned(
                  left: 22,
                  top: 50,
                  child: Container(
                    height: 422,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 11, vertical: 52),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Container(
                        width: 363,
                        height: 370,
                        padding: const EdgeInsets.only(
                          top: 57,
                          left: 34,
                          right: 35,
                          bottom: 56,
                        ),
                        decoration: BoxDecoration(
                          // Add your image decoration here
                          image: DecorationImage(
                            image: AssetImage("assets/logo.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 44,
                  top: 495,
                  child: SizedBox(
                    width: 343,
                    child: Text(
                      'Welcome to Dux!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0A6C14),
                        fontSize: 35,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 89,
                  top: 619,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the login page here
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // Set to transparent
                      shadowColor: Colors.transparent, // Set to transparent
                    ),
                    child: Container(
                      width: 252,
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: Color(0xFF0A6C14),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFCAD6FF),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 87,
                  top: 702,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the create account page here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccountPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // Set to transparent
                      shadowColor: Colors.transparent, // Set to transparent
                    ),
                    child: Container(
                      width: 252,
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFCAD6FF),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            color: Color(0xFF0A6C14),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 548,
                  child: SizedBox(
                    width: 326,
                    child: Text(
                      'Getaway to unique travel experiences',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 428,
      height: 926,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(width: 428, height: 926),
          ),
          Positioned(
            left: 168,
            top: 97,
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0A6C14),
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 1, // Adjusted height to 1
              ),
            ),
          ),
          Positioned(
            left: 31,
            top: 302,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 357,
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 35,
                            bottom: 20,
                          ),
                          decoration: ShapeDecoration(
                            color: Color(0xFFF1F4FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: Color(0xFF0A6C14),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Email',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF616161),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 1, // Adjusted height to 1
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 29),
                        Container(
                          width: 357,
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 35,
                            bottom: 20,
                          ),
                          decoration: ShapeDecoration(
                            color: Color(0xFFF1F4FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Password',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF616161),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 1, // Adjusted height to 1
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Forgot your password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF0A6C14),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 1, // Adjusted height to 1
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 357,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          decoration: ShapeDecoration(
                            color: Color(0xFF0A6C14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0xFFCAD6FF),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Sign in',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 1, // Adjusted height to 1
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: 357,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Create new account',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF494949),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 1, // Adjusted height to 1
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
          Positioned(
            left: 114,
            top: 736,
            child: Container(),
          ),
        ],
      ),
    );
  }
}



class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account Page'),
      ),
      // Add your create account page UI here
    );
  }
}
