import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medico/Views/Mainmenu.dart';
import 'package:medico/Widgets/widget.dart';

class signin extends StatefulWidget {
  final Function toggle;
  signin(this.toggle);
  @override
  _signinState createState() => _signinState();
}
class _signinState extends State<signin> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height - 50,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: emailEditingController,
                    style: simpleTextFieldStyle(),
                    decoration: textFieldInputDecoration("email"),
                  ),
                  TextField(
                    controller: passwordEditingController,
                    style: simpleTextFieldStyle(),
                    decoration: textFieldInputDecoration("Password"),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text("Forgot password?",
                        style: simpleTextFieldStyle(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  GestureDetector(
                    onTap: (){
                      check();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xFF6A1B9A),
                                const Color(0xFF7B1FA2)
                              ]
                          ),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text('SignIn',
                        style: mediumTextStyle(),),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text('SignIn with Google',
                      style: mediumTextStyle(),),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Don't have an account?", style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.toggle();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Register Now", style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ),
        ),
      ),
    );


  }
  Future<void> check()async{
    final formState = formkey.currentState;
    if(formState.validate()){
      formState.save();
    Future<AuthResult> user = FirebaseAuth.instance.signInWithEmailAndPassword(email:emailEditingController.text , password: passwordEditingController.text,);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Menu()));
    }
  }

}

