import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmingBooking extends StatelessWidget {
  const ConfirmingBooking({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0x8b000000),
          borderRadius: BorderRadius.circular(20.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     blurRadius: 10,
          //     offset: Offset(4, 8), // Shadow position
          //   ),
          // ]
        ),
        height: size.height * 0.05,
        width: size.width * 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Confirming booking..",
              style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}