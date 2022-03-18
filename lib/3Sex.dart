import 'package:another_flushbar/flushbar.dart';
import 'package:app/4Height.dart';
import 'package:flutter/material.dart';

class page3 extends StatefulWidget {
  double weight;
  page3({
    Key? key,
    required this.weight
  }) : super(key: key);

  @override
  _page3State createState() => _page3State();
}

class _page3State extends State<page3> {
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
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 50),
        child: Column(
          children: [
            Center(
              child: Text(
                "What is your sex?",
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: const Text("Your sex helps us make an accurate calculation for your personalized plan.",
                style: TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            RadioCard(
                Title: "Male",
                Value: 1,
                ICON: Icons.male,
                groupValue: _isSelected,
                ONCHANGE: (int _value){
                  setState(() {
                    _isSelected = _value;
                  });
                },
            ),
            SizedBox(height: 20,),
            RadioCard(
              Title: "Female",
              Value: 2,
              ICON: Icons.female,
              groupValue: _isSelected,
              ONCHANGE: (int _value){
                setState(() {
                  _isSelected = _value;
                });
              },
            ),
            Spacer(),
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
                value: 0.20,
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
                    if(_isSelected != 0){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => page4(
                                Sex: _isSelected,
                                weight: widget.weight,
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
      message: 'Please select your sex',
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
  final IconData ICON;



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
          leading: Icon(
            ICON,
            color: Colors.white,
            size: 40,
          ),
          title: Text(
            Title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
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
