import 'package:another_flushbar/flushbar.dart';
import 'package:app/9Goal.dart';
import 'package:flutter/material.dart';


class page8 extends StatefulWidget {
  int Calories;
  int height;
  int weight;
  int sex;
  int age;
  page8({
    Key? key,
    required this.Calories,
    required this.height,
    required this.weight,
    required this.age,
    required this.sex
  }) : super(key: key);

  @override
  _page8State createState() => _page8State();
}

class _page8State extends State<page8> {
  int _isCardSelected = 0;
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
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 50),
        child: Column(
          children: [
            Center(
              child: const Text(
                "Exercise Tracking",
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: const Text(
                "Please select your exercise tracking preference:",
                style: TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                RadioCards(
                  Title: "Track Exercise Manually",
                  Subtitle: "Your daily calorie goal will be increased only"
                      " on the days you track exercise by the number of "
                      "calories burned.",
                  Value: 1,
                  GroupValue: _isCardSelected,
                  ICON: Icons.run_circle_outlined,
                  ONCHANGE: (int _value){
                    setState(() {
                      _isCardSelected = _value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RadioCards(
                  Title: "Use a Weekly Estimate",
                  Subtitle: "Your daily calorie gaol will automatically factor"
                      " in your preset workout hours.",
                  Value: 2,
                  GroupValue: _isCardSelected,
                  ICON: Icons.calendar_today_outlined,
                  ONCHANGE: (int _value){
                    setState(() {
                      _isCardSelected = _value;
                    });
                  },
                ),
              ],
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
                value: 0.70,
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
                    if(_isCardSelected != 0) {
                      setState(() {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => page9(
                                  Calories: widget.Calories,
                                  weight: widget.weight,
                                  height: widget.height,
                                  sex: widget.sex,
                                  age: widget.age,
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
      message: 'Please select one category',
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

class RadioCards extends StatelessWidget {
  RadioCards({
    Key? key,
    required this.Title,
    required this.Subtitle,
    required this.ICON,
    required this.Value,
    required this.ONCHANGE,
    required this.GroupValue,
  }) : super(key: key);

  final String Title;
  final String Subtitle;
  final int Value;
  final ValueChanged<int> ONCHANGE;
  final IconData ICON;
  final int GroupValue;


  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          height: 130,
          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: ListTile(
              leading: Icon(
                ICON,
                color: Colors.white,
                size: 50,
              ),
              title: Text(
                Title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                Subtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              trailing: Radio(
                value: Value,
                onChanged: (int? _value) {
                  ONCHANGE(_value!);
                },
                groupValue: GroupValue,
              ),
            ),
          ),
        ),
        onTap: () {
          if (Value != GroupValue) {
            ONCHANGE(Value);
          }
          if(Value == GroupValue){
            ONCHANGE(0);
          }
        });
  }
}
