import 'package:another_flushbar/flushbar.dart';
import 'package:app/10Carbs.dart';
import 'package:flutter/material.dart';

class page9 extends StatefulWidget {
  int Calories;
  int height;
  int weight;
  int sex;
  int age;
  page9({
    Key? key,
    required this.Calories,
    required this.height,
    required this.weight,
    required this.age,
    required this.sex
  }) : super(key: key);

  @override
  _page9State createState() => _page9State();
}

class _page9State extends State<page9> {

  final List<Flushbar> flushBars = [];
  String gender = "";
  String goal = "";
  int _isSelected = 0;
  int Cal = 0;

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
              child: Text(
                "What is your goal?",
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Column(
              children: [
                RadioCard(
                  Title: "Lose Weight",
                  Value: 1,
                  ICON: Image.asset(
                    "images/loss.jpg",
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ),
                  groupValue: _isSelected,
                  ONCHANGE: (int _value){
                    setState(() {
                      _isSelected = _value;
                    });
                  },
                ),
                SizedBox(height: 10,),
                RadioCard(
                  Title: "Maintenance",
                  Value: 2,
                  ICON: Image.asset(
                    "images/maintain.png",
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ),
                  groupValue: _isSelected,
                  ONCHANGE: (int _value){
                    setState(() {
                      _isSelected = _value;
                    });
                  },
                ),
                SizedBox(height: 10,),
                RadioCard(
                  Title: "Gain Weight",
                  Value: 3,
                  ICON: Image.asset(
                    "images/muscle.png",
                    width: 40,
                    height: 40,
                    color: Colors.white,
                  ),
                  groupValue: _isSelected,
                  ONCHANGE: (int _value){
                    setState(() {
                      _isSelected = _value;
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: 210,
            ),
            Center(
              child: Container(
                width: 330,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo,),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
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
                    Text("Your information is confidential.",
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
                value: 0.80,
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
                    if(_isSelected == 1){
                      int percent = (widget.Calories * 0.15).toInt();
                      Cal = (widget.Calories - percent);
                    }
                    if(_isSelected == 2){
                      Cal = widget.Calories;
                    }
                    if(_isSelected == 3){
                      int percent = (widget.Calories * 0.18).toInt();
                      Cal = (widget.Calories + percent);
                    }
                    if(widget.sex == 1)
                      gender = "Male";
                    if(widget.sex == 2)
                      gender = "Female";
                    if(_isSelected == 1)
                      goal = "Lose weight";
                    if(_isSelected == 2)
                      goal = "Maintain weight";
                    if(_isSelected == 3)
                      goal = "Gain weight";
                    if(_isSelected != 0){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => page10(
                                Calories: Cal,
                                goal: goal,
                                gender: gender,
                                height: widget.height,
                                weight: widget.weight,
                                age: widget.age,
                              )
                          )
                      );
                    }
                    else {
                      setState(() {
                        showTopSnackBar(context);
                      });
                    }
                  },
                  child: const Text('Next',
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
  void showTopSnackBar(BuildContext context)  => show(context,
    Flushbar(
      icon: Icon(Icons.error, size: 32, color: Colors.red),
      shouldIconPulse: false,
      title: 'Error',
      message: 'Please select your goal',
      duration: Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(20),
      margin: EdgeInsets.fromLTRB(15, kToolbarHeight, 15, 0),
    ),
  );

  show(BuildContext context, Flushbar newFlushBar) async {
    await Future.wait(
        flushBars.map((flushBar) => flushBar.dismiss()).toList()
    );
    flushBars.clear();
    newFlushBar.show(context);
    flushBars.add(newFlushBar);
  }
}


class RadioCard extends StatelessWidget {
  const RadioCard({
    Key? key,
    required this.Title,
    required this.Value,
    required this.ICON,
    required this.groupValue,
    required this.ONCHANGE,

  }) : super(key: key);


  final String Title;
  final int groupValue;
  final int Value;
  final ValueChanged<int> ONCHANGE;
  final Image ICON;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.white24,
          //       blurRadius: 1,
          //       spreadRadius: 0,
          //       offset: Offset(2, 2)),
          // ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white24,
        ),
        child: ListTile(
          leading: ICON,
          title: Text(
            Title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          trailing: Radio(
            value: Value,
            onChanged: (int? _value) {
              ONCHANGE(_value!);
            },
            groupValue: groupValue,
          ),
        ),
      ),
      onTap: (){
        if(Value != groupValue) {
          ONCHANGE(Value);
        };
        if(Value == groupValue){
          ONCHANGE(0);
        }
      },
    );
  }

}
