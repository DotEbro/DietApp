import 'package:another_flushbar/flushbar.dart';
import 'package:app/8ExeTrack.dart';
import 'package:flutter/material.dart';

class page7 extends StatefulWidget {
  int Sex;
  int Age;
  int height;
  int weight;
  double WnH;
  page7({
    Key? key,
    required this.Sex,
    required this.WnH,
    required this.Age,
    required this.height,
    required this.weight
  }) : super(key: key);

  @override
  _page7State createState() => _page7State();
}

class _page7State extends State<page7> {
  int _isCardSelected = 0;
  final List<Flushbar> flushBars = [];
  int Calories = 0;

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
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 50),
        child: Column(
          children: [
            Center(
              child: const Text(
                "What is your daily activity level?",
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: const Text(
                "Based on your job.",
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
                  Title: "Sedentary",
                  Subtitle: "Typical desk job",
                  Value: 1,
                  GroupValue: _isCardSelected,
                  Icon: Image.asset(
                    "images/one.png",
                    height: 30,
                    width: 30,
                  ),
                  ONCHANGE: (int _value){
                    setState(() {
                      Calories = getCalories(1.08, 1.06);
                      _isCardSelected = _value;
                    });
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                RadioCards(
                  Title: "Lightly active",
                  Subtitle: "Walking around a good amount, retail job",
                  Value: 2,
                  GroupValue: _isCardSelected,
                  Icon: Image.asset(
                    "images/two.png",
                    height: 30,
                    width: 30,
                  ),
                  ONCHANGE: (int _value){
                    setState(() {
                      Calories = getCalories(1.22, 1.2);
                      _isCardSelected = _value;
                    });
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                RadioCards(
                  Title: "Moderately",
                  Subtitle: "Waiting tables",
                  Value: 3,
                  GroupValue: _isCardSelected,
                  Icon: Image.asset(
                    "images/three.png",
                    height: 30,
                    width: 30,
                  ),
                  ONCHANGE: (int _value){
                    setState(() {
                      Calories = getCalories(1.41, 1.38);
                      _isCardSelected = _value;
                    });
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                RadioCards(
                  Title: "Very active",
                  Subtitle: "very labor intensive, Construction workers",
                  Value: 4,
                  GroupValue: _isCardSelected,
                  Icon: Image.asset(
                    "images/four.png",
                    height: 30,
                    width: 30,
                  ),
                  ONCHANGE: (int _value){
                    setState(() {
                      Calories = getCalories(1.59, 1.56);
                      _isCardSelected = _value;
                    });
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                RadioCards(
                  Title: "Extra active",
                  Subtitle: "Professional Athlete",
                  Value: 5,
                  GroupValue: _isCardSelected,
                  Icon: Image.asset(
                    "images/five.png",
                    height: 30,
                    width: 30,
                  ),
                  ONCHANGE: (int _value){
                    setState(() {
                      Calories = getCalories(1.88, 1.84);
                    });
                  },
                ),
              ],
            ),
            Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: LinearProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.60,
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
                                builder: (context) => page8(
                                  Calories: Calories,
                                  weight: widget.weight,
                                  height: widget.height,
                                  sex: widget.Sex,
                                  age: widget.Age,
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

  int getCalories(double M_PA, double F_PA) {
    int Cal = 0;
    if(widget.Sex == 1) {
      Cal = (M_PA * (widget.WnH - widget.Age + 5)).toInt();
    }
    if(widget.Sex == 2){
      Cal = (F_PA * (widget.WnH - widget.Age - 161)).toInt();
    }
    return Cal;
  }

}

class RadioCards extends StatelessWidget {
  RadioCards({
    Key? key,
    required this.Title,
    required this.Subtitle,
    required this.Icon,
    required this.Value,
    required this.ONCHANGE,
    required this.GroupValue,
  }) : super(key: key);

  final String Title;
  final String Subtitle;
  final int Value;
  final ValueChanged<int> ONCHANGE;
  final Image Icon;
  final int GroupValue;


  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon,
            title: Text(
              Title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              Subtitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
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

