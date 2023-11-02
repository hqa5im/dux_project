import 'package:flutter/material.dart';
import 'package:dux_project/welcome.dart';

// display the match result
class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    color:
    Colors.transparent;
    return Material(
        child: Container(
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
            child: Container(
              width: 428,
              height: 926,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4699999988079071),
              ),
            ),
          ),
          Positioned(
            left: 22,
            top: 50,
            child: Container(
              height: 422,
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 52),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 363,
                    height: 370,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 50,
            top: 433,
            child: SizedBox(
              width: 343,
              child: Text(
                'Matched with Name!', // name of the matched user
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0A6C14),
                  fontSize: 35,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          ),

          // chat button
          Positioned(
              left: 70,
              top: 619,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashBoard()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Set to transparent
                  shadowColor: Colors.transparent, // Set to transparent
                ),
                child: Container(
                  width: 252,
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Chat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              )),

          // unmatch button
          Positioned(
            left: 70,
            top: 702,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoard()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent, // Set to transparent
                shadowColor: Colors.transparent, // Set to transparent
              ),
              child: Container(
                width: 252,
                height: 60,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFFCAD6FF),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Unmatch',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0A6C14),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 87,
            top: 133,
            child: Container(
              width: 260,
              height: 257,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/blank profile.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
