import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:femija_musliman/rendit_fjalet_quiz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dataset.dart';

class QuizDescription {
  String? title;
  bool visible;

  QuizDescription({required this.title, this.visible = false});
}

class RenditFjaletButton extends StatefulWidget {
  RenditFjaletButton({required this.QuizList, Key? key}) : super(key: key);
  late List QuizList;

  @override
  State<RenditFjaletButton> createState() => _RenditFjaletButtonState();
}

class _RenditFjaletButtonState extends State<RenditFjaletButton>
    with TickerProviderStateMixin {
  late Future<List<QuizInfo>?> futureData;

  List<QuizDescription> selectReportList = [];

  List<QuizDescription> quizList = [];

  bool showWord = true;
  int _selectedChipsIndex = 0;

  late AnimationController controller;

  void initState() {
    super.initState();
    futureData = fetchData1() as Future<List<QuizInfo>?>;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..addListener(() {
        setState(() {});
      });
    controller.animateTo(20.0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 13.h,
          backgroundColor: Color(0xFFEF6E98),
          title: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RenditFjaletScreen()));
                }
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: RichText(
                      text: TextSpan(
                        text: 'Rendit Fjalet \n   ',
                        style: GoogleFonts.fredokaOne(
                            textStyle: TextStyle(
                          fontSize: 25.0.sp,
                          color: Colors.white,
                        )),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Fjala numer: ',
                            style: GoogleFonts.fredokaOne(
                                textStyle: TextStyle(
                              fontSize: 18.0.sp,
                              color: Colors.white,
                            ))
                          )
                        ]
                      )
                    )
                  ))
            ]
          )
        ),
        body: FutureBuilder<List<QuizInfo>?>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<QuizInfo>? data = snapshot.data;

                return Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/background.PNG',
                            ),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: AppBar(
                        backgroundColor: Color(0xFFEF6E98),
                        automaticallyImplyLeading: false,
                      )),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40, top: 15),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          itemSize: 22,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 3,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          }
                        )
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 40,
                        left: 40,
                      ),
                      child: Container(
                        height: 7,
                        child: RotatedBox(
                          quarterTurns: -2,
                          child: LinearProgressIndicator(
                            value: controller.value,
                            color: Colors.white,
                            backgroundColor: Colors.yellow,
                          )
                        )
                      )
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Container(
                        margin: EdgeInsets.all(20),
                        child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 20,
                            children: List<Widget>.generate(
                                widget.QuizList.length, (int index) {
                              var chipsText = widget.QuizList[index].toString();

                              List<QuizDescription> quizList = [
                                QuizDescription(
                                    title: widget.QuizList[index].toString())
                              ];

                              void _handleTap(int index) {
                                setState(() {
                                  _selectedChipsIndex = index;
                                });
                              }

                              return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quizList[_selectedChipsIndex].visible =
                                          !(quizList[_selectedChipsIndex]
                                              .visible);
                                      if (quizList[_selectedChipsIndex]
                                          .visible) {
                                        selectReportList
                                            .add(quizList[_selectedChipsIndex]);
                                      } else {
                                        selectReportList.remove(
                                            quizList[_selectedChipsIndex]);
                                        selectReportList.join(', ');
                                      }
                                    });
                                  },
                                  child: Chip(
                                      label: Text(
                                        chipsText,
                                        style: GoogleFonts.fredokaOne(
                                          textStyle: TextStyle(
                                              fontSize: 20.0.sp,
                                              color: Colors.white),
                                        ),
                                      ),
                                      backgroundColor:
                                          quizList[_selectedChipsIndex].visible
                                              ? Color(0xff808080)
                                              : const Color(0xFF50CFFD)));
                            })))
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 170, left: 40),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                      direction: Axis.horizontal,
                                      spacing: 20,
                                      children: List<Widget>.generate(
                                          selectReportList.length, (int index) {
                                        return Text(
                                          " ${(selectReportList[index].title)}",
                                          style: GoogleFonts.fredokaOne(
                                              textStyle: TextStyle(
                                            fontSize: 20.0.sp,
                                            color: Color(0xFF50CFFD),
                                          ))
                                        );
                                      })),
                                  Divider(
                                    endIndent: 20,
                                    thickness: 5,
                                    color: Colors.pinkAccent,
                                  )
                                ]
                              )
                            ),
                            IconButton(
                                iconSize: 30,
                                onPressed: () {
                                  setState(() {
                                    selectReportList.clear();
                                  });
                                },
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.pinkAccent,
                                ))
                          ]
                        ))
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: FlatButton(
                              color: Color(0xFF0A869B),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Kontrollo",
                                  style: GoogleFonts.fredokaOne(
                                      textStyle: TextStyle(
                                          fontSize: 23.0.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              onPressed: () async {
                                var result = [];
                                await showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          backgroundColor: Color(0xFF50CFFD),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35.0))),
                                          content: Builder(
                                            builder: (context) {
                                              var height =
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height;
                                              var width = MediaQuery.of(context)
                                                  .size
                                                  .width;

                                              return Container(
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 110),
                                                        child: FlatButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              selectReportList
                                                                  .clear();

                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          },
                                                          child: Image.asset(
                                                            'assets/restartbutton.small.png',
                                                            height: 80,
                                                            width: 80,
                                                          )
                                                        )
                                                      )
                                                    ),
                                                    Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 110),
                                                        child: FlatButton(
                                                          onPressed: () {
                                                            if (result !=
                                                                    null &&
                                                                result
                                                                    is List) {
                                                              selectReportList[
                                                                      _selectedChipsIndex + 1]
                                                                  .title;
                                                              setState(() {});
                                                            }
                                                            Navigator.of(
                                                                    context)
                                                                .pop(result);
                                                          },
                                                          child: Image.asset(
                                                            'assets/next_small.png',
                                                            height: 80,
                                                            width: 80,
                                                          )
                                                        )
                                                      )
                                                    ),
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 100),
                                                        child: Image.asset(
                                                          'assets/threestars_big.png',
                                                          height: 200,
                                                          width: 200,
                                                        )
                                                      )
                                                    )
                                                  ]
                                                ),
                                                height: height - 450,
                                                width: width - 130,
                                              );
                                            }
                                          ),
                                          title: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 30),
                                            child: Center(
                                                child: Text(
                                              'Të lumtë Ajan',
                                              style: GoogleFonts.fredokaOne(
                                                  textStyle: TextStyle(
                                                fontSize: 25.0.sp,
                                                color: Colors.white,
                                              ))
                                            ))
                                          )
                                        ));
                              })))
                ]);
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
