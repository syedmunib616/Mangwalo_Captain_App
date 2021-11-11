import 'package:flutter/material.dart';
import 'package:flutter_maps/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

import 'component/cashTripPayment.dart';
import 'component/incentiveAndIcon.dart';
import 'component/lastCycle.dart';
import 'component/ratingAcceptAvailable.dart';
import 'component/topName.dart';
import 'component/trip.dart';
import 'component/unverifiedTrip.dart';
import 'component/weekBalance.dart';

class CaptainPortal extends StatelessWidget {
  CaptainPortal({Key key}) : super(key: key);
  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(
        title: Text(
          'Home',
          style: GoogleFonts.quicksand(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icons.home),
    TitledNavigationBarItem(
        title: Text(
          'Captain Portal',
          style: GoogleFonts.quicksand(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icons.view_quilt_sharp),
    TitledNavigationBarItem(
        title: Text(
          'Profile',
          style: GoogleFonts.quicksand(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff0f9914),
      ),
      bottomNavigationBar: TitledBottomNavigationBar(
        onTap: (index) => print("Selected Index: $index"),
        //reverse: navBarMode,
        curve: Curves.easeInBack,
        items: items,
        activeColor: Color(0xff0f9914),
        inactiveColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: TopName(size: size)),
            ),

            Positioned(
              top: 120,
              left: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: RatingAcceptaneAvailavle(size: size),
              ),
            ),

            Positioned(
              top: 260,
              left: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: IncentivesAndIcon(size: size),
              ),
            ),

            Positioned(
              top: 337,
              left: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: WeekBalance(size: size),
              ),
            ),

            Positioned(
              top: 455,
              left: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(1, 2), // Shadow position
                        ),
                      ]),
                  height: size.height * .325,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LastCycle(size: size),
                        Trip(),
                        UnverifiedTrip(),
                        CashTripPayment()
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Positioned(
            //   top: 25,
            //   left: 25,
            //   child: BlurryContainer(
            //     borderRadius: BorderRadius.circular(20),
            //     bgColor: Colors.white,
            //     child: Container(
            //       // margin: EdgeInsets.only(
            //       //     left: 10, right: 10, bottom: 10, top: 10),
            //       width: size.width * .8,
            //       height: size.height * .2,
            //       decoration: BoxDecoration(
            //         // boxShadow: [
            //         //   BoxShadow(
            //         //     offset: Offset(0, 15),
            //         //     blurRadius: 10,
            //         //     color: LightColors.Shadowcolorimage,
            //         //   ),
            //         // ],
            //         borderRadius: BorderRadius.circular(20),
            //         image: DecorationImage(
            //             image: AssetImage('assets/logo.png'), fit: BoxFit.fill),
            //       ),
            //     ),
            //   ),
            // ),
            // Center(
            //   //child: mangwaloButton(context),
            //   child: mangwaloButton(context),
            // ),
            // Positioned(
            //   bottom: 20,
            //   left: 80,
            //   child: Center(
            //     //child: mangwaloButton(context),
            //     child: mangwaloButton1(context),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

// GestureDetector mangwaloButton1(BuildContext context) {
//   return GestureDetector(
//     onTap: () {
//       showAlertDialog(context);
//     },
//     child: Container(
//       decoration: BoxDecoration(
//         color: Color(0xE2E58100),
//         borderRadius: BorderRadius.circular(40.0),
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Colors.grey,
//         //     blurRadius: 10,
//         //     offset: Offset(4, 8), // Shadow position
//         //   ),
//         // ]
//       ),
//       height: MediaQuery.of(context).size.height * 0.060,
//       width: MediaQuery.of(context).size.width * 0.7,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Center(
//           child: Text(
//             "Tap for Mangwalo",
//             style:
//                 GoogleFonts.dekko(fontSize: 23, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// GestureDetector mangwaloButton(BuildContext context) {
//   return GestureDetector(
//     onTap: () {
//       showAlertDialog(context);
//     },
//     child: Container(
//       decoration: BoxDecoration(
//         color: Color(0xE2E58100),
//         borderRadius: BorderRadius.circular(40.0),
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Colors.grey,
//         //     blurRadius: 10,
//         //     offset: Offset(4, 8), // Shadow position
//         //   ),
//         // ]
//       ),
//       height: MediaQuery.of(context).size.height * 0.250,
//       width: MediaQuery.of(context).size.width * 0.4,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Image.asset("assets/1.png"),
//             Text(
//               "Tap for Mangwalo",
//               style: GoogleFonts.dekko(
//                   fontSize: 15, fontWeight: FontWeight.bold),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
// showAlertDialog(BuildContext context) {
//   // set up the button
//   Widget okButton = FlatButton(
//     child: Text("OK"),
//     onPressed: () {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => MyHomePage()));
//       // setState(() {
//       //   ok = true;
//       //   Navigator.pop(context);
//       // });
//     },
//   );
//
//   Widget cencel = FlatButton(
//     child: Text("Cencel"),
//     onPressed: () {
//       Navigator.pop(context);
//     },
//   );
//
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: BlurryContainer(
//       borderRadius: BorderRadius.circular(20),
//       bgColor: Colors.white,
//       child: Column(
//         children: [
//           Text("Type any item"),
//           TextField(),
//         ],
//       ),
//     ),
//     // content: TextFormField(),
//     actions: [okButton, cencel],
//   );
//
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
}
