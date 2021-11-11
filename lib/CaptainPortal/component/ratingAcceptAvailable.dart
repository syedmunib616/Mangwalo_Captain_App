import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingAcceptaneAvailavle extends StatelessWidget {
  const RatingAcceptaneAvailavle({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
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
          height: size.height * .12,
          width: size.width * .3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .005,
                ),
                Icon(
                  Icons.timer,
                  color: Color(0xff0f9914),
                ),
                Text(
                  "AVAILABLE\n  HOURS",
                  style: GoogleFonts.adventPro(
                    fontSize: 14,
                  ),
                ),
                Text(
                  "6h 33m",
                  style: GoogleFonts.adventPro(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0f9914)),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Container(
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
          height: size.height * .12,
          width: size.width * .3,
          child: Column(
            children: [
              SizedBox(
                height: size.height * .011,
              ),
              Icon(
                Icons.star,
                color: Color(0xff0f9914),
              ),
              Text(
                "CAPTAIN\n RATING",
                style: GoogleFonts.adventPro(
                  fontSize: 14,
                ),
              ),
              Text(
                "5.00",
                style: GoogleFonts.adventPro(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0f9914)),
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
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
          height: size.height * .12,
          width: size.width * .3,
          child: Column(
            children: [
              SizedBox(
                height: size.height * .011,
              ),
              Icon(
                Icons.check_circle_sharp,
                color: Color(0xff0f9914),
              ),
              Text(
                "ACCEPTANCE\n     RATE",
                style: GoogleFonts.adventPro(
                  fontSize: 14,
                ),
              ),
              Text(
                "93.3%",
                style: GoogleFonts.adventPro(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0f9914)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}