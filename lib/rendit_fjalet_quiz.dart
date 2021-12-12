import 'dart:async';
import 'dart:convert';
import 'package:femija_musliman/homescreen.dart';
import 'package:femija_musliman/renditfjalet_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'dataset.dart';
import 'homescreen.dart';

class RenditFjaletScreen extends StatefulWidget {
  @override
  State<RenditFjaletScreen> createState() => _RenditFjaletScreenState();
}

class _RenditFjaletScreenState extends State<RenditFjaletScreen> {
  late Future<List<QuizInfo>?> futureData;
  int counter = 1;

  void initState() {
    super.initState();
    futureData = fetchData1() as Future<List<QuizInfo>?>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 10.h,
            backgroundColor: Color(0xFFEF6E98),
            title: Row(children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {},
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Text(
                      "Rendit Fjalet",
                      style: GoogleFonts.fredokaOne(
                          textStyle: TextStyle(
                            fontSize: 22.0.sp,
                            color: Colors.white,
                          ))
                  )
              )
            ])
        ),
        body: FutureBuilder<List<QuizInfo>?>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<QuizInfo>? data = snapshot.data;
                data?.sort((a, b) => a.level.compareTo(b.level));

                return Stack(children: [
                  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/background.PNG',
                              ),
                              fit: BoxFit.cover)),
                      child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GridView.count(
                              crossAxisCount: 4,
                              children: List.generate(data!.length, (index) {
                                return InkWell(
                                    splashColor: Colors.blue.withAlpha(20),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RenditFjaletButton(
                                                    QuizList: data[index].word,
                                                    AllQuizLists: data,
                                                    CurrentIndex: index,
                                                  )));
                                    },
                                    child: Card(
                                        elevation: 3.0,
                                        margin: EdgeInsets.all(7.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0)),
                                        child: Container(
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                    child: Text(
                                                        '${data[index].level}',
                                                        style: GoogleFonts.fredokaOne(
                                                            textStyle: TextStyle(
                                                              fontSize: 30.0.sp,
                                                              color: Color(0xFF50CFFD),
                                                            ))
                                                    )
                                                ))
                                        )
                                    )
                                );
                              })
                          )
                      ))
                ]);
              } else if (snapshot.hasError) {
                return Text("OO ILAZZZ ${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}


