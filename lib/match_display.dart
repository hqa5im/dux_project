// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:dux_project/pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// display the match result
class ResultPage extends StatefulWidget {
  final String matchEmail;

  // Constructor
  ResultPage({required this.matchEmail});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
    color:Colors.transparent;
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
                'Matched with ${widget.matchEmail}!', // name of the matched user
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF06215C),
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
                    MaterialPageRoute(builder: (context) => MatchProfile(matchEmail: widget.matchEmail)),
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
                    color: Color(0xFF06215C),
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
                        'View Profile',                         // takes you to another page that shows the matched user's profile
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
                      'Chat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF06215C),
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

// shows the profile of the matched user
class MatchProfile extends StatefulWidget {
  final String matchEmail;

  MatchProfile({required this.matchEmail});
  
  @override
  _MatchProfileState createState() => _MatchProfileState();
}

class _MatchProfileState extends State<MatchProfile> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<String>? language;
  List<String>? location;
  List<String>? preference;

  Future<void> getMatchedUserData() async {
    DocumentReference docRef = firestore.collection('profiles').doc(widget.matchEmail);
    DocumentSnapshot doc = await docRef.get();
    if (doc.data() != null) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      language = List<String>.from(data['language'] as List<dynamic>);
      location = List<String>.from(data['location'] as List<dynamic>);
      preference = List<String>.from(data['preference'] as List<dynamic>);

      setState(() {
      preference = preference;
    });
    } else {
      throw Exception('User data is null');
    }
  }

  // send match notifcation to other user
  Future<void> sendMatchNotification() async {
    CollectionReference matches = firestore.collection('matches');

    // Add a new document with the match data
    await matches.add({
      'user1': FirebaseAuth.instance.currentUser!.email, // logged in user email
      'user2': widget.matchEmail, // matched user email
      'timestamp': FieldValue.serverTimestamp(), // The time when the match was made
    });
  }

  @override
  void initState() {
    super.initState();
    getMatchedUserData();
  }

  @override
  Widget build(BuildContext context) {
    String languageStr = language?.join(', ') ?? '';
    String locationStr = location?.join(', ') ?? '';
    String preferenceStr = preference?.join(', ') ?? '';
    return Material(
      color: Colors.transparent,
      
      // branding on top
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
              left: 46,
              top: 78,
              child: SizedBox(
                width: 343,
                child: Text(
                  'Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF06215C),
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 266,
              top: 227,
              child: SizedBox(
                width: 89,
                height: 41,
                child: Text(
                  'Location',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 47,
              top: 393,
              child: SizedBox(
                width: 134,
                height: 52,
                child: Text(
                  'Language Spoken: $language',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 240,
              top: 393,
              child: SizedBox(
                width: 141,
                height: 52,
                child: Text(
                  'Travel Preferences',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 72,
              top: 745,
              child: ElevatedButton(
                  onPressed: () {
                    sendMatchNotification(); /// added
                    // Navigate to the create account page here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashBoard()),
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
                        color: Color(0xFF06215C),
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
              left: 72,
              top: 669,
              child: ElevatedButton(
                  onPressed: () {
                    sendMatchNotification(); /// added
                    // Navigate to the create account page here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MatchList(userEmail: widget.matchEmail)),
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
                  color: Color(0xFF06215C),
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
                      'Match',
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
              ),
            ),
            Positioned(
              left: 43,
              top: 162,
              child: Text(
                'Email: ${widget.matchEmail}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF06215C),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 43,
              top: 231,
              child: Text(
                'Location: $locationStr',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF06215C),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 46,
              top: 297,
              child: Text(
                'Language’s spoken: $languageStr',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF06215C),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 43,
              top: 363,
              child: Container(
                width: MediaQuery.of(context).size.width -
                    86, // adjust the width as needed
                child: SingleChildScrollView(
                  child: Text(
                    'Travel Preferences: $preferenceStr',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF06215C),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 43,
              top: 550,
              child: Text(
                'Fee: 20 dollars per hour',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF06215C),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 42,
              top: 488,
              child: Text(
                'Availability: Everyday 9am-5pm',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF06215C),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// shows notification when a match is made
class MatchList extends StatefulWidget {
  final String userEmail;

  MatchList({required this.userEmail});

  @override
  _MatchListState createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> matches = [];

  @override
  void initState() {
    super.initState();
    fetchMatches();
  }

  Future<void> fetchMatches() async {
    CollectionReference matchesCollection = firestore.collection('matches');

    QuerySnapshot querySnapshot = await matchesCollection
        .where('user1', isEqualTo: widget.userEmail)
        .get();
    QuerySnapshot querySnapshot2 = await matchesCollection
        .where('user2', isEqualTo: widget.userEmail)
        .get();

    List<Map<String, dynamic>> fetchedMatches = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .where((item) => item != null)
        .toList();
    fetchedMatches.addAll(querySnapshot2.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .where((item) => item != null)
        .toList());

    setState(() {
      matches = fetchedMatches;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    

    return Material(
    child: Stack(
      children: [
        Positioned(
          left: 46,
          top: 95,
          child: SizedBox(
            width: 343,
            child: Text(
              'Notifications',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF06215C),
                fontSize: 35,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 100.0), // Adjust the value as needed
          child: ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, index) {
              return Container(
                width: 200,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the value as needed
                  ),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'Match between ${matches[index]['user1']} and ${matches[index]['user2']}',
                        style: TextStyle(
                          fontFamily: 'Poppins', // Set the font family
                          fontSize: 20, // Set the font size
                          fontWeight: FontWeight.w600, // Set the font weight
                        ),
                      ),
                    ),
                    subtitle: Text(
                      'Matched on: ${matches[index]['timestamp']?.toDate() ?? 'N/A'}',
                      style: TextStyle(
                        fontFamily: 'Poppins', // Set the font family
                        fontSize: 16, // Set the font size
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    )
    );
  }
}