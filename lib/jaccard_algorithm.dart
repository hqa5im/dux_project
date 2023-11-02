import 'package:flutter/material.dart';
import 'package:dux_project/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// get the jaccard index of two sets
Future<Map<String, dynamic>> getProfileData(String email) async {

  final DocumentSnapshot<Map<String, dynamic>> docSnapshot =
      await _firestore.collection('profiles').doc(email).get();

  if (docSnapshot.exists) {
    return docSnapshot.data()!;
  } else {
    throw Exception('No profile found for this email');
  }
}

// fetches all profiles from Firestore
Future<Map<String, Map<String, dynamic>>> getEmailsAndData() async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await _firestore.collection('profiles').get();

  final Map<String, Map<String, dynamic>> emailsAndData = {};

  for (final doc in querySnapshot.docs) {
    emailsAndData[doc.id] = doc.data();
  }

  return emailsAndData;
}

// calculates the jaccard similarity
double jaccardSimilarity(List<String> list1, List<String> list2) {
  final intersection = list1.toSet().intersection(list2.toSet()).length;
  final union = list1.toSet().union(list2.toSet()).length;

  return intersection / union;
}

// calculates the jaccard similarity of two users
Future<double> calculateSimilarity(Map<String, dynamic> profile1, Map<String, dynamic> profile2) async {
  final rolesSimilarity = jaccardSimilarity(List<String>.from(profile1['roles']), List<String>.from(profile2['roles']));
  final locationSimilarity = jaccardSimilarity(List<String>.from(profile1['location']), List<String>.from(profile2['location']));
  final languageSimilarity = jaccardSimilarity(List<String>.from(profile1['language']), List<String>.from(profile2['language']));
  final preferenceSimilarity = jaccardSimilarity(List<String>.from(profile1['preference']), List<String>.from(profile2['preference']));

  // Calculate the average similarity across all categories
  final similarity = (rolesSimilarity + locationSimilarity + languageSimilarity + preferenceSimilarity) / 4;

  return similarity;
}


Future<String> jaccardAlgorithm(String email) async {
  final profile1 = await getProfileData(email);
  final allProfiles = await getEmailsAndData();

  String bestMatch = 'no one yet';
  double highestSimilarity = 0;

  for (final profile2 in allProfiles.entries) {
    if (profile2.key != email) {
      final similarity = await calculateSimilarity(profile1, profile2.value);
      if (similarity > highestSimilarity) {
        highestSimilarity = similarity;
        bestMatch = profile2.key;
      }
    }
  }

  // print("best match: $bestMatch");
  return bestMatch;
}

