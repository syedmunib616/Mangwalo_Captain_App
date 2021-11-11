import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/Authencation/SginUp.dart';
import 'package:flutter_maps/main.dart';
import 'package:google_fonts/google_fonts.dart';

class Landing extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error} "),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, AsyncSnapshot<User> snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  User user = snapshot.data;
                  if (user == null) {
                    return SginIn();
                  } else {
                    return MyHomePage(
                      user: snapshot.data.uid?.toString(),
                    );
                  }
                }
                return Scaffold(
                  body: Center(
                    child: Text("Checking Authentication ..."),
                  ),
                );
              });
        }
        return Scaffold(
          body: Center(
            child: Text("Connecting to the App.."),
          ),
        );
      },
    );
  }
}

class SginIn extends StatefulWidget {
  const SginIn({Key key}) : super(key: key);

  @override
  _SginInState createState() => _SginInState();
}

class _SginInState extends State<SginIn> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Text(
                  "Login",
                  style: GoogleFonts.ovo(
                      fontSize: 29, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.2,
                ),
                TextFormField(
                  onSaved: (input) => _email = input,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: GoogleFonts.marvel(
                      fontSize: 21,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onSaved: (input) => _password = input,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: GoogleFonts.marvel(
                      fontSize: 21,
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
                  onPressed: signIn,
                  child: Container(
                    height: size.height * 0.09,
                    width: size.width * 0.4,
                    child: Center(
                      child: Text(
                        "Sgin In",
                        style: GoogleFonts.arimo(
                            fontSize: 19, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SginUp()));
                  },
                  child: Container(
                    height: size.height * 0.09,
                    width: size.width * 0.4,
                    child: Center(
                      child: Text(
                        "Register",
                        style: GoogleFonts.arimo(
                            fontSize: 19, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //User usermap;
  Future signIn() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password)
            .then((res) {
          print("$res");
        }).catchError((err) {
          print("$err");
        });
        print("user user ${user.user}");
        print("user  ${user}");
        // usermap = FirebaseAuth.instance.currentUser;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(
                      user: user.user?.uid?.toString(),
                      //usermap: usermap,
                    )));
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
