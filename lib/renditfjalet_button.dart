import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:femija_musliman/rendit_fjalet_quiz.dart';

import 'dataset.dart';

class RenditFjaletButton extends StatefulWidget {
  RenditFjaletButton({required this.QuizList, Key? key}) : super(key: key); /// Asking for a list to be passed in from the other screen.
  late List QuizList;

  @override
  State<RenditFjaletButton> createState() => _RenditFjaletButtonState();
}

class _RenditFjaletButtonState extends State<RenditFjaletButton> {
  late Future<List<QuizInfo>?> futureData;

  int counter = 1;
  int counterForChips = 0;

  void initState() {
    super.initState();
    futureData = fetchData1() as Future<List<QuizInfo>?>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 23.h,
            backgroundColor: Color(0xFFEF6E98),
            title: Column(children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text(
                    'Rendit Fjalet',
                    style: TextStyle(fontSize: 25.sp),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 60, bottom: 60),
                    child: Text(
                      '- Fjala numer:  -',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ))
            ])),
        body: FutureBuilder<List<QuizInfo>?>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<QuizInfo>? data = snapshot.data;

                //String displayWords = data![3].word[counter].toString();
                return Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/background.PNG',
                            ),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      margin: EdgeInsets.all(20),
                      child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 20,
                          children: List<Widget>.generate(widget.QuizList.length, (int index) { /// Setting the length of the list equal to the number of words
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RenditFjaletScreen()));
                                },
                                child: Chip(
                                  label: Text(
                                    widget.QuizList[index].toString(), /// Displaying words from the list based on the index inside the future builder
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Color(0xFF50CFFD),
                                ));
                          })))
                ]);
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}

/*child: Container(
              width: 28.w,
              height: 15.h,
              child: Card(

                 child: InkWell(
                  onTap: null,
          ),
                child: Wrap(
            direction: Axis.vertical,
                spacing: 10,
                color: Color(0xFF50CFFD),
                elevation: 3.0,
                margin: EdgeInsets.all(7.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text('Heelo',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      )),
                ),
              ),
            ),
          ),*/
