import 'package:femija_musliman/rreth_nesh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:femija_musliman/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:femija_musliman/rreth_nesh.dart';
import 'rendit_fjalet_quiz.dart';

class ChooseQuiz extends StatelessWidget {
  final nameHolder;

  ChooseQuiz({@required this.nameHolder});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/background.PNG'),
            fit: BoxFit.fill,
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 180,
            left: 40,
          ),
          child: Container(
              height: 12.0.h,
              width: 90.0.w,
              //color: Colors.transparent,
              child: Container(
                child: FlatButton(
                  color: Color(0xFF0A869B),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Selam Alejkum " + nameHolder,
                        style: GoogleFonts.fredokaOne(
                            textStyle: TextStyle(
                              fontSize: 19.0.sp,
                              color: Colors.white,
                            )),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0))),
                ),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: FlatButton(
              child: Text(
                'Rreth nesh',
                style: GoogleFonts.fredokaOne(
                    textStyle: TextStyle(
                      fontSize: 22.0.sp,
                      color: Colors.grey,
                    )),
              ),
              color: Colors.transparent,
              textColor: Colors.grey,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RrethNesh()));
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 300, left: 30),
          child: Container(
              height: 20.0.h,
              width: 43.0.w,
              //color: Colors.transparent,
              child: Container(
                child: FlatButton(
                  color: Color(0xFFEF6E98),
                  child: Text(
                    "RENDIT \nFJALET",
                    style: GoogleFonts.fredokaOne(
                        textStyle: TextStyle(
                          fontSize: 23.0.sp,
                          color: Colors.white,
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RenditFjaletScreen()));
                  },
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 300, left: 217),
          child: Container(
              height: 20.0.h,
              width: 43.0.w,
              //color: Colors.transparent,
              child: Container(
                child: FlatButton(
                  color: Color(0xFF0A869B),
                  child: Text(
                    "KUIZI",
                    style: GoogleFonts.fredokaOne(
                        textStyle: TextStyle(
                          fontSize: 23.0.sp,
                          color: Colors.white,
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 450, left: 20),
          child: Container(
              height: 20.0.h,
              width: 93.0.w,
              //color: Colors.transparent,
              child: Container(
                child: FlatButton(
                  color: Color(0xFF50CFFD),
                  child: Text(
                    "KERKO FJALE",
                    style: GoogleFonts.fredokaOne(
                        textStyle: TextStyle(
                          fontSize: 23.0.sp,
                          color: Colors.white,
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 510, left: 45),
          child: Container(
            width: 50.h,
            height: 50.h,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/femijatext.png'),

              //fit: BoxFit.cover,
            )),
          ),
        ),
      ],
    ));
  }
}
