import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:femija_musliman/main.dart';
import 'package:femija_musliman/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class RrethNesh extends StatelessWidget {
  const RrethNesh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/background.PNG'),
          fit: BoxFit.cover,
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
              )))),
      Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 250, left: 22),
          child: RichText(
            text: TextSpan(
              text: 'Pergaditi: ',
              style: GoogleFonts.fredokaOne(
                  textStyle:
                      TextStyle(fontSize: 15.0.sp, color: Color(0xFF0A869B))),
              children: <TextSpan>[
                TextSpan(
                  text: 'Ummu Muhamed Breznica',
                  style: GoogleFonts.fredokaOne(
                      textStyle: TextStyle(
                          fontSize: 16.0.sp, color: Color(0xFF50CFFD))),
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 550, right: 10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                //width: 50.h,
                //height: 50.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
              image: AssetImage('assets/arsyesmall.png'),
            ))),
          )),
      Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 305, left: 78),
          child: RichText(
            text: TextSpan(
              text: 'Kontrolloi: ',
              style: GoogleFonts.fredokaOne(
                  textStyle:
                      TextStyle(fontSize: 16.0.sp, color: Color(0xFF0A869B))),
              children: <TextSpan>[
                TextSpan(
                  text: 'Petrit Perçuku',
                  style: GoogleFonts.fredokaOne(
                      textStyle: TextStyle(
                          fontSize: 16.0.sp, color: Color(0xFF50CFFD))),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        child: Padding(
            padding: const EdgeInsets.only(
              bottom: 115,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Mundesuar nga',
                style: GoogleFonts.fredokaOne(
                    textStyle:
                        TextStyle(fontSize: 22.0.sp, color: Color(0xFF50CFFD))),
              ),
            )),
      ),
      Container(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text('www.arsye.com',
                style: GoogleFonts.fredokaOne(
                    textStyle:
                        TextStyle(fontSize: 20.0.sp, color: Colors.grey))),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 130),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            child: TextButton(
              child: Text(
                'femijamusliman.com',
                style: GoogleFonts.fredokaOne(
                    textStyle:
                        TextStyle(fontSize: 22.0.sp, color: Color(0xFF50CFFD))),
              ),
              onPressed: () async =>
                  {await launch('https://femijamusliman.com')},
            ),
          ),
        ),
      ),
    ]));
  }
}
