import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<KuizData>> fetchData2() async {
  String username = 'mobile-client';
  String password = 'f3m1j@mu5l1m@n-m0b1l3';
  String basicAuth = base64Encode(utf8.encode('$username:$password'));
  print("BASOICCCCCCCCPPPPP $basicAuth");
  var url = "https://fm-srvc.herokuapp.com/api/quiz-questions";
  var response = await http.get(
    Uri.parse(url),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $basicAuth',
    },
  );
  print("Hellooo ${response.statusCode}");
  if (response.statusCode == 200) {
    List data2 = json.decode(utf8.decode(response.bodyBytes));
    return data2.map((data) => KuizData.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured');
  }
}

class KuizData {
  int level;
  String question;
  List options;
  String answer;
  int time;

  KuizData(
      {required this.level,
      required this.question,
      required this.options,
      required this.answer,
      required this.time});

  factory KuizData.fromJson(Map<String, dynamic> json) {
    return KuizData(
        level: json['level'] as int,
        question: json['question'] as String,
        options: json['options'] as List,
        answer: json['answer'] as String,
        time: json['time'] as int);
  }
}
