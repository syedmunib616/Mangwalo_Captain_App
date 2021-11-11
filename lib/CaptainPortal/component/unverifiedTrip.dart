import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnverifiedTrip extends StatelessWidget {
  const UnverifiedTrip({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Unverified trips",
          style: GoogleFonts.adventPro(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(
              " x   1",
              style: GoogleFonts.arimo(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              "Rs 77.93",
              style: GoogleFonts.arimo(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Text(
          "Unverified trips will be verified in few days",
          style: GoogleFonts.adventPro(
            fontSize: 13,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.0, top: 8),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Color(0xff0f9914),
          ),
        ),
      ],
    );
  }
}
