import 'package:flutter/material.dart';
import 'package:app/3Sex.dart';

class page2 extends StatefulWidget {
  page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  TextEditingController weightCon = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool correctData = false;
  double weight = 0.0;
  bool KGclick = false;
  bool Lbsclick = false;

  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1A1728),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A1728),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 50),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: const Text("What is your current weight?",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: const Text("Your weight helps us make an accurate calculation"
                      " for your personalized plan.",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Center(
                  child: TextFormField(
                    controller: weightCon,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 30, color: Colors.white,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      FlatButton(
                        onPressed: () => {
                          setState((){
                            if(KGclick == true){
                              KGclick = false;
                              Lbsclick = true;
                            }
                            if(KGclick == false){
                              KGclick = true;
                              Lbsclick = false;
                            }
                          })
                        },
                        child: const Text('KG',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        color: (KGclick == true) ? const Color(0xFF07D7B7) : Colors.white,
                        minWidth: 115,
                        height: 35,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            if(Lbsclick == true){
                              KGclick = true;
                              Lbsclick = false;
                            }
                            if(Lbsclick == false){
                              KGclick = false;
                              Lbsclick = true;
                            }
                          });
                        },
                        child: const Text('Lbs',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        color: (Lbsclick == true) ? const Color(0xFF07D7B7) : Colors.white,
                        minWidth: 115,
                        height: 35,
                      ),
                    ],
                  ),
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
                    value: 0.10,
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
        )
    );

  void validate(){
    if(formKey.currentState!.validate()){
      if (KGclick == true || Lbsclick == true) {
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => page3(weight: weight))
        );
      }
    }
  }

  String? validatePass(value){
    function(value);
    if((KGclick == true || Lbsclick == true) && value =="")
      return "Weight is required";
    if(KGclick == false && Lbsclick == false)
      return "Please select one weight";
    if(weight > 40 && weight < 90){
      return null;
    }
    else{
      return "Enter correct weight";
    }
  }

  void function(var value) {
    if(Lbsclick == true && value != ""){
      weight =  double.parse(weightCon.text);
      weight = (weight * 0.453592);
    }
    if(KGclick == true && value != ""){
      weight = double.parse(weightCon.text);
    }
  }

}