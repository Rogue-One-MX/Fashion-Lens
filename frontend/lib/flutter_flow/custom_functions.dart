import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String returnProfileGreeting(DateTime timestamp) {
  // return "morning" if it is morning, "afternoon" if afternoon and "night" if it is night
  var hour = timestamp.hour;
  if (hour >= 0 && hour < 12) {
    return "Good morning,";
  } else if (hour >= 12 && hour < 17) {
    return "Good afternoon,";
  } else {
    return "Goodnight,";
  }
}

String getLink(String nameProduct) {
  String formattedName = nameProduct.replaceAll(' ', '+');
  return 'https://www.liverpool.com.mx/tienda?s=$formattedName';
}

int removeUnderscore(String myString) {
  // Split the input string at the underscore
  String beforeUnderscore = myString.split('_')[0];

  // Convert the result to an integer and return it
  return int.parse(beforeUnderscore);
}
