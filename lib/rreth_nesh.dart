import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:femija_musliman/main.dart';
import 'package:femija_musliman/homescreen.dart';
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
          padding: const EdgeInsets.only(top: 250, left: 35),
          child: RichText(
            text: TextSpan(
              text: 'Pergaditi: ',
              style: TextStyle(fontSize: 16.sp, color: Color(0xFF0A869B)),
              children: <TextSpan>[
                TextSpan(
                    text: 'Ummu Muhamed Breznica',
                    style:
                        TextStyle(fontSize: 16.sp, color: Color(0xFF50CFFD))),
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
              style: TextStyle(fontSize: 16.sp, color: Color(0xFF0A869B)),
              children: <TextSpan>[
                TextSpan(
                    text: 'Petrit Perçuku',
                    style:
                        TextStyle(fontSize: 16.sp, color: Color(0xFF50CFFD))),
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
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF50CFFD)),
              ),
            )),
      ),
      Container(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            'www.arsye.com',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        ),
      )),
      Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Text(
                'femijamusliman.com',
                style: TextStyle(fontSize: 20.sp, color: Color(0xFF50CFFD)),
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
