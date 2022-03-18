import 'package:another_flushbar/flushbar.dart';
import 'package:app/6BodyFat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class page5 extends StatefulWidget {
  int Sex;
  int weight;
  int height;
  double WnH;
  page5({
    Key? key,
    required this.WnH,
    required this.Sex,
    required this.height,
    required this.weight
  }) : super(key: key);

  @override
  _page5State createState() => _page5State();
}

class _page5State extends State<page5> {
  final List<Flushbar> flushBars = [];
  TextEditingController dateCon = new TextEditingController();
  late DateTime pickedDate = DateTime.now();
  String DOB = "";
  int age = 0;
  bool feet = false;
  bool CM = false;

  @override
  void initState() {
    // TODO: implement initState
    dateCon.text = DateFormat.yMMMMd('en_US').format(pickedDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF1A1728),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1728),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 50),
        child: Column(
          children: [
            Center(
              child: const Text(
                "What is your birthday?",
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: const Text(
                "Your birthday helps us make an accurate calculation"
                " for your personalized plan.",
                style: TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50,),
            Center(
              child: TextField(
                controller: dateCon,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,

                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
                readOnly: true,
                onTap: () async {
                  pickedDate = (await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2030)))!;
                  DOB = DateFormat.yMMMMd('en_US').format(pickedDate);
                  setState(() {
                    age = calculateAge(pickedDate);
                    dateCon.text = DOB;
                  });
                },
                style: TextStyle(
                  color: Color(0xFF07D7B7),
                  fontSize: 25,
                ),
              ),
            ),
            Spacer(),
            Center(
              child: Container(
                width: 330,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.indigo,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Row(
                  children: [
                    Icon(
                      Icons.gpp_good,
                      color: Colors.indigo,
                      size: 35,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Your information is confidential.",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: LinearProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.40,
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
                  onPressed: () {
                    if (pickedDate.isBefore(DateTime.now())) {
                      age = calculateAge(pickedDate);
                      if (age >= 15.0) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => page6(
                                  WnH: widget.WnH,
                                  Sex: widget.Sex,
                                  wight: widget.weight,
                                  height: widget.height,
                                  Age: age,
                                )));
                      } else {
                        setState(() {
                          underAge(context);
                        });
                      }
                    } else {
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

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = (currentDate.year - birthDate.year);
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  void fillError(BuildContext context) => show(
        context,
        Flushbar(
          icon: Icon(Icons.error, size: 32, color: Colors.red),
          shouldIconPulse: false,
          title: 'Error',
          message: 'Please select your correct date of birth',
          duration: Duration(seconds: 2),
          flushbarPosition: FlushbarPosition.TOP,
          borderRadius: BorderRadius.circular(20),
          margin: EdgeInsets.fromLTRB(15, kToolbarHeight, 15, 0),
        ),
      );

  void underAge(BuildContext context) => show(
        context,
        Flushbar(
          icon: Icon(Icons.error, size: 32, color: Colors.red),
          shouldIconPulse: false,
          title: 'Error',
          message: 'Sorry! you are under age',
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
