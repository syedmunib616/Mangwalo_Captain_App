import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CashTripPayment extends StatelessWidget {
  const CashTripPayment({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cash Trip Payment",
          style: GoogleFonts.adventPro(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(
              " x   5",
              style: GoogleFonts.arimo(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              "Rs 1007.93",
              style: GoogleFonts.arimo(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
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