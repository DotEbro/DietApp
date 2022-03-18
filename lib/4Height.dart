import 'package:app/5age.dart';
import 'package:flutter/material.dart';

class page4 extends StatefulWidget {
  int Sex;
  double weight;
  page4({
    Key? key,
    required this.weight,
    required this.Sex
  }) : super(key: key);

  @override
  _page4State createState() => _page4State();
}

class _page4State extends State<page4> {
  TextEditingController heightCon = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  double height = 0;
  bool CM = false;
  double WnH = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1A1728),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1728),
        elevation: 0,
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 50),
          child: Column(
            children: [
              Center(
                child: const Text(
                  "What is your height?",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: const Text(
                  "Your height helps us make an accurate calculation"
                  " for your personalized plan.",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Center(
                child: TextFormField(
                  controller: heightCon,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                  ),
                  validator: validatePass,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (CM == true) {
                        CM = false;
                      }
                      else{
                        CM = true;
                      }
                    });
                  },
                  child: const Text(
                    'cm',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  color: (CM == true) ? const Color(0xFF07D7B7) : Colors.white,
                  minWidth: 135,
                  height: 35,
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
                  value: 0.30,
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
                    onPressed: validate,
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
      ),
    );
  }

  void validate(){
    int weight = (widget.weight).toInt();
    int Height = height.toInt();
    if(formKey.currentState!.validate()){
      height = height * 6.25;
      widget.weight = widget.weight * 10;
      WnH = (height + widget.weight);
      if (CM == true) {
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => page5(
                  Sex: widget.Sex,
                  weight: weight,
                  height: Height,
                  WnH: WnH,
                )
            )
        );
      }
    }
  }

  String? validatePass(value){
    if(CM == true && value != "") {
      height = double.parse(heightCon.text);
      if(height > 140 && height < 200) {
        return null;
      }
      else{
        return "Enter correct height";
      }
    }
    if(CM == true && value == ""){
      return "Height is required";
    }
    if(CM == false) {
      return "Please select the cm button";
    }
  }
}
