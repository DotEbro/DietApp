import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '11Result.dart';

class page10 extends StatefulWidget {
  int Calories;
  String goal;
  String gender;
  int height;
  int weight;
  int age;
  page10({
    Key? key,
    required this.Calories,
    required this.goal,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
  }) : super(key: key);

  @override
  _page10State createState() => _page10State();
}

class _page10State extends State<page10> {
  final List<Flushbar> flushBars = [];
  bool selectMale = false;
  bool selectFemale = false;
  int _isSelected = 0;

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
            Text(
              "What is your goal?",
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              "Net carbs are the carbs which raise your blood sugar and provide "
                  "calories. Fiber and sugar alcohols are not counted towards net "
                  "carbs. Typically Dieto and low carb dieters count only net carbs.",
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                RadioCard(
                  Title: "Net Carbs",
                  Subtitle: "Net carbs only include carbs that the body can fully digest into glucose.",
                  Value: 1,
                  ICON: Image.asset(
                    "images/sugar-free.png",
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
                ),
                SizedBox(height: 10,),
                RadioCard(
                  Title: "Total Carbs",
                  Subtitle: "Total carbs include all the different types of carb"
                      " in a food or meal. These include starches, dietary fiber, and sugars.",
                  Value: 2,
                  ICON: Image.asset(
                    "images/beef.png",
                    width: 40,
                    height: 40,
                  ),
                  groupValue: _isSelected,
                  ONCHANGE: (int _value){
                    setState(() {
                      _isSelected = _value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 160,
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
                value: 0.90,
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
                    final Cal = widget.Calories.toInt();
                    if(_isSelected != 0){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => page11(
                                Calories: Cal,
                                gender: widget.gender,
                                height: widget.height,
                                weight: widget.height,
                                age: widget.age,
                                goal: widget.goal,
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
    required this.Subtitle,
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
  final String Subtitle;



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
          subtitle: Text(
            Subtitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13
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
