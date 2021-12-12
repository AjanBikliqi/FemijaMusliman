import 'package:femija_musliman/dataset_forKuiz.dart';
import 'package:femija_musliman/kuizLevels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class KuizQuestions extends StatefulWidget {
  KuizQuestions({
    required this.KuizOptions,
    required this.AllKuizLists,
    required this.CurrentIndexForKuiz,
    this.KuizQuestion,
    Key? key,
  }) : super(key: key);
  late List AllKuizLists;
  late List KuizOptions;
  late int CurrentIndexForKuiz;
  late String? KuizQuestion;

  @override
  _KuizQuestionsState createState() => _KuizQuestionsState();
}

class _KuizQuestionsState extends State<KuizQuestions>
    with TickerProviderStateMixin {
  late Future<List<KuizData>?> futureData2;
  late AnimationController controller;
  int selectedAnswerIndex = 0;

  List listOfColors = [
    Container(
      color: Colors.pink.shade300,
    ),
    Container(
      color: Colors.orange.shade400,
    ),
    Container(
      color: Colors.green.shade800,
    ),
    Container(
      color: Colors.blue.shade400,
    )
  ];

  void initState() {
    futureData2 = fetchData2();
    super.initState();
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
        toolbarHeight: 60,
        backgroundColor: Color(0xFF0A869B),
        title: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Kuizi()));
              },
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 105),
                child: Text(
                  'Kuizi',
                  style: GoogleFonts.fredokaOne(
                    textStyle: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<KuizData>?>(
          future: futureData2,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<KuizData>? data = snapshot.data;

              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/background.PNG',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    color: Color(0xFF0A869B),
                    height: 200,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: RotatedBox(
                            quarterTurns: -2,
                            child: LinearProgressIndicator(
                              value: controller.value,
                              color: Colors.white,
                              backgroundColor: Colors.yellow,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, left: 3),
                          child: Text(
                            widget.KuizQuestion.toString(),
                            style: GoogleFonts.fredokaOne(
                              textStyle: TextStyle(
                                  fontSize: 15.5.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 157, left: 23),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Wrap(
                        direction: Axis.vertical,
                        spacing: 20,
                        children: List<Widget>.generate(
                            widget.KuizOptions.length, (int index) {
                          var answersText =
                              widget.KuizOptions[index].toString();

                          void _handleTapForAnswer(int index) {
                            setState(
                              () {
                                selectedAnswerIndex = index;
                              },
                            );
                          }

                          String _setImage() {
                            if (data![widget.CurrentIndexForKuiz].answer ==
                                data[widget.CurrentIndexForKuiz].options) {
                              return "return 'assets/threestars_big.png";
                            } else if (data[widget.CurrentIndexForKuiz].answer !=
                                data[widget.CurrentIndexForKuiz].options) {
                              return 'assets/zerostars_big.png';
                            } else {
                              return '';
                            }
                          }

                          return GestureDetector(
                              onTap: () async {
                                await showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    backgroundColor: Color(0xFF50CFFD),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    content: Builder(builder: (context) {
                                      var height =
                                          MediaQuery.of(context).size.height;
                                      var width =
                                          MediaQuery.of(context).size.width;

                                      return Container(
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 110),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Image.asset(
                                                    'assets/restartbutton.small.png',
                                                    height: 80,
                                                    width: 80,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 110),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);

                                                    /// E close munu
                                                    Navigator.pop(context);

                                                    /// E hek current quiz page
                                                    Navigator.push(
                                                      /// E qel next level quiz
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            KuizQuestions(
                                                          KuizOptions: widget
                                                              .AllKuizLists[
                                                                  widget.CurrentIndexForKuiz +
                                                                      1]
                                                              .options,
                                                          AllKuizLists: widget
                                                              .AllKuizLists,
                                                          CurrentIndexForKuiz:
                                                              widget.CurrentIndexForKuiz +
                                                                  1,
                                                          KuizQuestion: widget
                                                              .AllKuizLists[
                                                                  widget.CurrentIndexForKuiz +
                                                                      1]
                                                              .question,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Image.asset(
                                                    'assets/next_small.png',
                                                    height: 80,
                                                    width: 80,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Center(
                                                child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 100),
                                              child: Image.asset(
                                                _setImage(),
                                                height: 200,
                                                width: 200,
                                              ),
                                            )),
                                          ],
                                        ),
                                        height: height - 450,
                                        width: width - 130,
                                      );
                                    }),
                                    title: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Center(
                                        child: Text(
                                          'Të lumtë Ajan',
                                          style: GoogleFonts.fredokaOne(
                                            textStyle: TextStyle(
                                              fontSize: 25.0.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Chip(
                                backgroundColor: Colors.blue,
                                label: Container(
                                  width: 80.w,
                                  height: 11.3.h,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      answersText,
                                      style: GoogleFonts.fredokaOne(
                                        textStyle: TextStyle(
                                            fontSize: 20.0.sp,
                                            color: Colors.white),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ));
                        }),
                      ),
                    ),
                  )
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
