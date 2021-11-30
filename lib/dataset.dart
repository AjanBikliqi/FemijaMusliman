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

/*class QuizInfo1 {
  int level;

  QuizInfo1({required this.level});
}

Future<List?> fetchData1(int level) async {
  authorization() async {
    String username = 'mobile-client';
    String password = 'f3m1j@mu5l1m@n-m0b1l3';
    String basicAuth =
        'Basic' + base64Encode(utf8.encode('$username:$password'));

    var url = "https://fm-srvc.herokuapp.com/api/order-words";
    headers:
    <String, String>{'authorization': basicAuth};

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> data1 = json.decode(response.body);

      var levels = data1["level"];
      QuizInfo1 quizContainsLevel = QuizInfo1(level: levels['level']);
    }
  }
}

class QuizInfo2 {
  String words;

  QuizInfo2({required this.words});
}

Future<List?> fetchData2(String words) async {
  authorization() async {
    String username = 'mobile-client';
    String password = 'f3m1j@mu5l1m@n-m0b1l3';
    String basicAuth =
        'Basic' + base64Encode(utf8.encode('$username:$password'));

    var url = "https://fm-srvc.herokuapp.com/api/order-words";
    headers:
    <String, String>{'authorization': basicAuth};
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> data2 = json.decode(response.body);

      var word = data2["words"];
      QuizInfo2 quizContainsWord = QuizInfo2(words: word['words']);
    }
  }
}

class QuizInfo3 {
  String sentence;

  QuizInfo3({required this.sentence});
}

Future<List?> fetchData3(String sentence) async {
  authorization() async {
    String username = 'shush';
    String password = 'shush';
    String basicAuth =
        'Basic' + base64Encode(utf8.encode('$username:$password'));

    var url = "https://fm-srvc.herokuapp.com/api/order-words";
    headers:
    <String, String>{'authorization': basicAuth};
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> data3 = json.decode(response.body);

      var sentences = data3["sentence"];
      QuizInfo3 quizContainsSentence =
          QuizInfo3(sentence: sentences['sentence']);
    }
  }
}

class QuizInfo4 {
  int time;

  QuizInfo4({required this.time});
}

Future<List?> fetchData4(int time) async {
  authorization() async {
    String username = 'mobile-client';
    String password = 'f3m1j@mu5l1m@n-m0b1l3';
    String basicAuth =
        'Basic' + base64Encode(utf8.encode('$username:$password'));

    var url = "https://fm-srvc.herokuapp.com/api/order-words";
    headers:
    <String, String>{'authorization': basicAuth};
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> data4 = json.decode(response.body);

      var timer = data4["time"];
      QuizInfo4 quizContainsTime = QuizInfo4(time: timer['time']);
    }
  }
}*/
