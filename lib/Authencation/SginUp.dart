import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'landingpage.dart';

class SginUp extends StatelessWidget {
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController confrompassword = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                "Sgin Up",
                style:
                    GoogleFonts.ovo(fontSize: 29, fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: size.height * 0.1,
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              //   child: TextField(
              //     controller: name,
              //     keyboardType: TextInputType.text,
              //     decoration: InputDecoration(
              //       labelText: "Name",
              //       labelStyle: GoogleFonts.arimo(
              //         fontSize: 19,
              //       ),
              //     ),
              //     style: GoogleFonts.arimo(
              //       fontSize: 19,
              //     ),
              //   ),
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: GoogleFonts.arimo(
                      fontSize: 19,
                    ),
                  ),
                  style: GoogleFonts.arimo(
                    fontSize: 19,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                child: TextField(
                  obscureText: true,
                  controller: confrompassword,
                  decoration: InputDecoration(
                    labelText: "Conform Password",
                    labelStyle: GoogleFonts.arimo(
                      fontSize: 19,
                    ),
                  ),
                  style: GoogleFonts.arimo(
                    fontSize: 19,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: GoogleFonts.arimo(
                      fontSize: 19,
                    ),
                  ),
                  style: GoogleFonts.arimo(
                    fontSize: 19,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              MaterialButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  print("Email: ${email.text} ");
                  if (password.text != null &&
                      confrompassword.text != null &&
                      confrompassword.text == password.text &&
                      email.text != null &&
                      email.text != "") {
                    registerNewUser(context);
                    print("guddi chal gai");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Landing()));
                  } else {
                    print(
                        "guddi nhi chali ${password.text} ${confrompassword.text} ${email.text}");
                    Fluttertoast.showToast(
                        msg: "Something is not properly inserted",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Container(
                  height: size.height * 0.09,
                  width: size.width * 0.4,
                  child: Center(
                    child: Text(
                      "Sgin Up",
                      style:
                          GoogleFonts.arimo(fontSize: 19, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  displaytoast(BuildContext context, String message) {
    Fluttertoast.showToast(msg: message);
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final userRef =
      FirebaseDatabase.instance.reference().child("users").child("drivers");
  void registerNewUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
        .createUserWithEmailAndPassword(
      email: "${email.text}",
      password: "${password.text}",
    )
        .then((res) {
      print("$res");
    }).catchError((err) {
      print("$err");
    }));
    //.user;
    // if (firebaseUser != null) {
    //
    // } else {
    //   displaytoast(context, "New user account has not been Created.");
    // }
  }
}
