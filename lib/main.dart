import 'package:femija_musliman/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:femija_musliman/rreth_nesh.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    });
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final name = TextEditingController();

  getItemAndNavigate() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChooseQuiz(
                  nameHolder: name.text,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/background.PNG'),
                fit: BoxFit.cover,
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 170, left: 20),
              child: Container(
                height: 12.0.h,
                width: 70.0.w,
                //color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF0A869B),
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    child: new Center(
                      child: new Text(
                        "Si quhesh?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 313, left: 105, right: 10),
                child: Container(
                  height: 14.0.h,
                  width: 80.0.w,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFEF6E98),
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      child: Align(
                        child: new Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: new TextField(
                              controller: name,
                              cursorColor: Colors.white70,
                              cursorWidth: 1,
                              //textAlign: TextAlign.start,
                              decoration: null,
                              autofocus: true,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      )),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 522),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/femijatext.png'),

                  //fit: BoxFit.cover,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 330, left: 250),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/light_right_small.png'),

                  //fit: BoxFit.cover,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 55, right: 220),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/light_left_small.png'),

                  //fit: BoxFit.cover,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 480, left: 105),
              child: Container(
                  height: 12.0.h,
                  width: 56.0.w,
                  //color: Colors.transparent,
                  child: Container(
                    child: FlatButton(
                      color: Color(0xFF50CFFD),
                      child: Text(
                        "Fillo",
                        style: TextStyle(
                            fontSize: 23.0.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        Navigator.push(context, getItemAndNavigate());
                        MaterialPageRoute(
                          builder: (context) => ChooseQuiz(nameHolder: name),
                        );
                      },
                    ),
                  )),
            ),
            Container(
                child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: new Text(
                    "www.arsye.com",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )),
          ],
        ));
  }
}
