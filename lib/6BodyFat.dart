// ignore_for_file: deprecated_member_use

import 'package:another_flushbar/flushbar.dart';
import 'package:app/7PA.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class page6 extends StatefulWidget {
  int Sex;
  int height;
  int wight;
  double WnH;
  int Age;
  page6({
    Key? key,
    required this.Sex,
    required this.WnH,
    required this.Age,
    required this.height,
    required this.wight
  }) : super(key: key);

  @override
  _page6State createState() => _page6State();
}

class _page6State extends State<page6> {

  int fat = 0;
  TextEditingController fatCon = new TextEditingController();
  final List<Flushbar> flushBars = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1A1728),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1728),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          children: [
            Center(
              child: const Text(
                "What is your body fat percentage?",
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: const Text(
                "Please select one that most closely resembles your body type.",
                style: TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: TextField(
                controller: fatCon,
                decoration: InputDecoration(
                  hintText: "Tap the picture for fat percentage",
                  hintStyle: TextStyle(color: Colors.grey[600], fontSize: 13),
                  labelStyle: TextStyle(
                    fontSize: 30, color: Colors.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 35, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          child: Image.asset("images/body1.jpg"),
                        ),
                        onTap: (){
                          setState(() {
                            fat = 4;
                            fatCon.text = "4%";
                          });
                        },
                      ),
                      Text("4%", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          child: Image.asset("images/body2.jpg"),
                        ),
                        onTap: (){
                          setState(() {
                            fat = 8;
                            fatCon.text = "8%";
                          });
                        },
                      ),
                      Text("8%", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          child: Image.asset("images/body3.jpg"),
                        ),
                        onTap: (){
                          setState(() {
                            fat = 11;
                            fatCon.text = "11%";
                          });
                        },
                      ),
                      Text("11%", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          child: Image.asset("images/body4.jpg"),
                        ),
                        onTap: (){
                          setState(() {
                            fat = 15;
                            fatCon.text = "15%";
                          });
                        },
                      ),
                      Text("15%", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          child: Image.asset("images/body5.jpg"),
                        ),
                        onTap: (){
                          setState(() {
                            fat = 20;
                            fatCon.text = "20%";
                          });
                        },
                      ),
                      Text("20%", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          child: Image.asset("images/body6.jpg"),
                        ),
                        onTap: (){
                          setState(() {
                            fat = 25;
                            fatCon.text = "25%";
                          });
                        },
                      ),
                      Text("25%", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          child: Image.asset("images/body7.jpg"),
                        ),
                        onTap: (){
                          setState(() {
                            fat = 30;
                            fatCon.text = "30%";
                          });
                        },
                      ),
                      Text("30%", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          child: Image.asset("images/body8.jpg"),
                        ),
                        onTap: (){
                          setState(() {
                            fat = 35;
                            fatCon.text = "35%";
                          });
                        },
                      ),
                      Text("35%", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          child: Image.asset("images/body9.jpg"),
                        ),
                        onTap: (){
                          setState(() {
                            fat = 40;
                            fatCon.text = "40%";
                          });
                        },
                      ),
                      Text("40%", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: LinearProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.50,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: SizedBox(
                width: 330,
                height: 50,
                child: RaisedButton(
                  onPressed: (){
                    if(fat != 0) {
                      setState(() {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => page7(
                                  WnH: widget.WnH,
                                  Age: widget.Age,
                                  Sex: widget.Sex,
                                  height: widget.height,
                                  weight: widget.wight,
                                )
                            )
                        );
                      });
                    }
                    else {
                      setState(() {
                        fillError(context);
                      });
                    }
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  color: const Color(0xFF07D7B7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void fillError(BuildContext context) => show(
    context,
    Flushbar(
      icon: Icon(Icons.error, size: 32, color: Colors.red),
      shouldIconPulse: false,
      title: 'Error',
      message: 'Please enter the correct percentage of fat',
      duration: Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(20),
      margin: EdgeInsets.fromLTRB(15, kToolbarHeight, 15, 0),
    ),
  );

  show(BuildContext context, Flushbar newFlushBar) async {
    await Future.wait(flushBars.map((flushBar) => flushBar.dismiss()).toList());
    flushBars.clear();
    newFlushBar.show(context);
    flushBars.add(newFlushBar);
  }
}
