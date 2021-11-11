import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopName extends StatelessWidget {
  const TopName({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(4, 8), // Shadow position
            ),
          ]),
      height: size.height * .09,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back_ios_sharp,
                color: Color(0xff0f9914),
              ),
              Text(
                "Older",
                style: GoogleFonts.adventPro(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0f9914)),
              ),
            ],
          ),
          SizedBox(
            width: size.width * 0.2,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Khalid AL Jaaidi",
                style: GoogleFonts.adventPro(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Open cycle",
                style: GoogleFonts.adventPro(
                  fontSize: 15,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
