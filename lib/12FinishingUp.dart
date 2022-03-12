import 'package:app/0AppDataBase.dart';
import 'package:app/13.0mainPage.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Page12 extends StatefulWidget {
  int height;
  String gender;
  int weight;
  int age;
  String goal;
  int cal;
  int protein;
  int fats;
  int carbs;
  Page12({
    Key? key,
    required this.height,
    required this.gender,
    required this.weight,
    required this.age,
    required this.goal,
    required this.cal,
    required this.protein,
    required this.fats,
    required this.carbs,
  }) : super(key: key);

  @override
  _Page12State createState() => _Page12State();
}

class _Page12State extends State<Page12> {

  var formKey = GlobalKey<FormState>();
  late List<Columns> list;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

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
          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            children: [
              Text(
                "Finishing Up",
                style: TextStyle(fontSize: 28, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                "Fill in the following field so that we can register you "
                    "in our data base",
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 80,
              ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  label: Text("Enter Your Full Name",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value){
                  if(value!.isEmpty || RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)){
                    return "Enter correct Name";
                  }
                  else{
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white,)
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: email,
                  decoration: InputDecoration(
                    label: Text("Enter Your email",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: MultiValidator(
                      [
                        RequiredValidator(errorText: "Email is required"),
                        EmailValidator(errorText: "Not a valid Email")
                      ]
                  ),
                  style: TextStyle(color: Colors.white,)
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pass,
                  decoration: InputDecoration(
                    label: Text("Enter password",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: validatePass,
                  style: TextStyle(color: Colors.white,)
              ),
              SizedBox(height: 30,),
              Center(
                child: SizedBox(
                  width: 270,
                  height: 45,
                  child: RaisedButton(
                    onPressed: (){
                      validate;
                      //addUser();
                      //deleteUser();
                      //printUser();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => page13()));
                    }, //,
                    child: const Text('Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 18),
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

  deleteUser() async{
    final firstL = list[0];
    await dbHelper.instance.delete(firstL.id!);
  }

  printUser() async {
    list = await dbHelper.instance.queryAll();
    print(list);
    final note = list[0];
    print(note.id);
    print(note.name);
    print(note.email);
    print(note.pass);
    print(note.height);
    print(note.sex);
    print(note.weight);
    print(note.carbs);
    print(note.cal);
    print(note.protein);
    print(note.age);
    print(note.fats);
    print(note.carbs);

  }

  addUser() async{
    final Col = Columns(
        name: name.text,
        email: email.text,
        pass: pass.text,
        weight: widget.weight,
        sex: widget.gender,
        height: widget.height,
        age: widget.age,
        goal: widget.goal,
        cal: widget.cal,
        protein: widget.protein,
        fats: widget.fats,
        carbs: widget.carbs
    );

    await dbHelper.instance.create(Col);
  }

  validate() {
    final isValid = formKey.currentState!.validate();
  }

  // Future create() async{
  //   final list = Columns(
  //       name: "abrar", //name.text,
  //       email: "engrabrar", //email.text,
  //       pass: "abrark",//pass.text,
  //       weight: 70,//widget.weight,
  //       sex: "male",//widget.gender,
  //       height: 170,//widget.height,
  //       age: 21,//widget.age,
  //       goal: "Lose weight",//widget.goal,
  //       cal: 2183,//widget.cal,
  //       protein: 48,//widget.protein,
  //       fats: 157,//widget.fats,
  //       carbs: 25,//widget.carbs
  //   );
  //   await dbHelper.instance.create(list);
  // }

  String? validatePass(value){
    if((pass.text).length > 5 && (pass.text).length < 13)
      return null;
    else{
      return "Password must between 6 and 12 characters";
    }
  }

}
