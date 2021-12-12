import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<QuizInfo>> fetchData1() async {
  String username = 'mobile-client';
  String password = 'f3m1j@mu5l1m@n-m0b1l3';
  String basicAuth = base64Encode(utf8.encode('$username:$password'));
  print("BASOICCCCCCCCPPPPP $basicAuth");
  var url = "https://fm-srvc.herokuapp.com/api/order-words";
  var response = await http.get(
    Uri.parse(url),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $basicAuth',
    },
  );
  print("Hellooo ${response.statusCode}");
  if (response.statusCode == 200) {
    List data1 = json.decode(utf8.decode(response.bodyBytes));
    return data1.map((data) => QuizInfo.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured');
  }
}

class QuizInfo {
  int level;
  List word;
  String sentence;
  int timer;

  QuizInfo(
      {required this.level,
      required this.word,
      required this.sentence,
      required this.timer});

  factory QuizInfo.fromJson(Map<String, dynamic> json) {
    return QuizInfo(
        level: json['level'],
        word: json['words'],
        sentence: json['sentence'],
        timer: json['time']);
  }
}