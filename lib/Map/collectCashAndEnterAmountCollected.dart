import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CollectCashAndEnterAmountCollected extends StatelessWidget {
  CollectCashAndEnterAmountCollected({
    @required this.size,
    @required this.submit,
    @required this.arr,
  });

  final Size size;
  String submit;
  String arr;
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: size.height * 0.37,
    //   //color: Colors.red,
    //   child: Column(
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(20.0),
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Color(0xd88d8d8d),
    //                 blurRadius: 10,
    //                 offset: Offset(4, 8), // Shadow position
    //               ),
    //             ]),
    //         height: size.height * .13,
    //         width: size.width * .9,
    //         child: Column(
    //           children: [
    //             Container(
    //               height: size.height * .07,
    //               width: size.width * .8,
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     "Collect cash",
    //                     style: GoogleFonts.lato(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 25,
    //                     ),
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //                   Text(
    //                     "from Mohammad Imran",
    //                     style: GoogleFonts.lato(
    //                       color: Colors.grey,
    //                       fontSize: 18,
    //                     ),
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 20),
    //               child: Container(
    //                 height: size.height * 0.06,
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Text(
    //                       "Total Fare",
    //                       style: GoogleFonts.lato(
    //                           fontSize: 17, fontWeight: FontWeight.bold),
    //                     ),
    //                     Spacer(),
    //                     Text(
    //                       "Rs 560",
    //                       style: GoogleFonts.lato(
    //                           fontSize: 25, fontWeight: FontWeight.bold),
    //                     ),
    //                     SizedBox(
    //                       width: size.width * 0.01,
    //                     ),
    //                     Icon(Icons.arrow_circle_down)
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Container(
    //         decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(20.0),
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Color(0xd88d8d8d),
    //                 blurRadius: 10,
    //                 offset: Offset(4, 8), // Shadow position
    //               ),
    //             ]),
    //         height: size.height * .13,
    //         width: size.width * .9,
    //         child: Padding(
    //           padding: const EdgeInsets.only(
    //               left: 25.0, right: 25, top: 10, bottom: 15),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 "Enter amount collected",
    //                 style: GoogleFonts.lato(
    //                     fontSize: 25, fontWeight: FontWeight.bold),
    //               ),
    //               Spacer(),
    //               TextField(
    //                 decoration: InputDecoration(
    //                     labelText: "Enter your number",
    //                     labelStyle: GoogleFonts.lato(
    //                         fontSize: 15, fontWeight: FontWeight.bold)),
    //                 keyboardType: TextInputType.number,
    //                 inputFormatters: <TextInputFormatter>[
    //                   FilteringTextInputFormatter.digitsOnly
    //                 ], // Only numbers can be entered
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         height: size.height * 0.0155,
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           setState(() {
    //             submit == "guddi";
    //             arr == "guddi";
    //           });
    //         },
    //         child: Container(
    //           decoration: BoxDecoration(
    //               color: Color(0xff0f9914),
    //               borderRadius: BorderRadius.circular(20.0),
    //               boxShadow: [
    //                 BoxShadow(
    //                   color: Color(0xd88d8d8d),
    //                   blurRadius: 10,
    //                   offset: Offset(4, 8), // Shadow position
    //                 ),
    //               ]),
    //           height: size.height * 0.06,
    //           width: size.width * 0.8,
    //           child: Center(
    //             child: Text(
    //               "Submit",
    //               style: GoogleFonts.lato(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 25,
    //                   color: Colors.white),
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
