// ignore_for_file: deprecated_member_use

import 'package:another_flushbar/flushbar.dart';
import 'package:app/7PA.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class page6 extends StatefulWidget {
  int Sex; int height; int wight; double WnH; int Age;
  page6({Key? key, required this.Sex, required this.WnH, required this.Age, required this.height, required this.wight}) : super(key: key);

  @override
  _page6State createState() => _page6State();
}

class _page6State extends State<page6> {

  int fat = 0;
  TextEditingController fatCon = new TextEditingController();
  final List<Flushbar> flushBars = [];
  final listItem = [
    {"fats" : "4-6%", "pic": "images/body1.jpg"},
    {"fats" : "8-10%", "pic" : "images/body2.jpg"},
    {"fats" : "12%", "pic" : "images/body3.jpg"},
    {"fats" : "15%", "pic" : "images/body4.jpg"},
    {"fats" : "20%", "pic" : "images/body5.jpg"},
    {"fats" : "25%", "pic" : "images/body6.jpg"},
    {"fats" : "30%", "pic" : "images/body7.jpg"},
    {"fats" : "35%", "pic" : "images/body8.jpg"},
    {"fats" : "40%", "pic" : "images/body9.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1A1728),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1728),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
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
              GridView.builder(
                shrinkWrap: true,
                itemCount: listItem.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index){
                  return bodyPic((listItem[index]["fats"])!, (listItem[index]["pic"])!);
                  }
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

  bodyPic(String Fats, String Image){
    return AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(Image),
                      fit: BoxFit.cover
                  )
              ),
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.03),
                        ]
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      Fats.toString(),
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 14,
                        fontFamily: "NoyhR_regular",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: (){
              setState(() {
                if(Fats == "4-6%") {
                  fatCon.text = "5%";
                  fat = 5;
                } else if(Fats == "8-10%") {
                  fatCon.text = "9%";
                  fat = 9;
                } else {
                  fatCon.text = Fats;
                  fat = 10;
                }
              });
            },
          ),
        )
    );
  }

}

// class BodyPic extends StatefulWidget {
//   final Fats;
//   final Image;
//   const BodyPic({Key? key, required this.Fats, required this.Image}) : super(key: key);
//
//   @override
//   State<BodyPic> createState() => _BodyPicState();
// }
//
// class _BodyPicState extends State<BodyPic> {
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1 / 1,
//       child: Container(
//         margin: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: InkWell(
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                     image: AssetImage(widget.Image),
//                     fit: BoxFit.cover
//                 )
//             ),
//             child: Container(
//               padding: EdgeInsets.only(bottom: 5),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   gradient: LinearGradient(
//                       begin: Alignment.bottomRight,
//                       colors: [
//                         Colors.black.withOpacity(.8),
//                         Colors.black.withOpacity(.03),
//                       ]
//                   )
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     widget.Fats.toString(),
//                     style: TextStyle(
//                       color: Colors.grey[300],
//                       fontSize: 14,
//                       fontFamily: "NoyhR_regular",
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           onTap: (){
//             setState(() {
//
//             });
//           },
//         ),
//       )
//     );
//   }
// }


