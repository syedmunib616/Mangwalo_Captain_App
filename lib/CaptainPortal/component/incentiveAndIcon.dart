import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class IncentivesAndIcon extends StatelessWidget {
  const IncentivesAndIcon({
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
              blurRadius: 5,
              offset: Offset(1, 2), // Shadow position
            ),
          ]),
      height: size.height * .06,
      child: Row(
        children: [
          SizedBox(
            width: size.width * .04,
          ),
          Icon(
            Icons.monetization_on,
            color: Color(0xff0f9914),
          ),
          SizedBox(
            width: size.width * .04,
          ),
          Text(
            "Incentives",
            style: GoogleFonts.adventPro(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff0f9914)),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Color(0xff0f9914),
          ),
          SizedBox(
            width: size.width * .04,
          ),
        ],
      ),
    );
  }
}
