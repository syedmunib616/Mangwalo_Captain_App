import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekBalance extends StatelessWidget {
  const WeekBalance({
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
      height: size.height * .1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.03,
              ),
              Text(
                "This Week's Balance",
                style: GoogleFonts.adventPro(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text("Rs 10400.50",
                  style: GoogleFonts.adventPro(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                width: size.width * 0.03,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Color(0xff0f9914),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.03,
              ),
              Icon(
                Icons.wallet_travel_sharp,
                color: Color(0xff0f9914),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                "Total Cash Balance",
                style: GoogleFonts.adventPro(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Icon(
                Icons.new_label,
                color: Color(0xff0f9914),
              ),
              Spacer(),
              Text("Rs 20346.50",
                  style: GoogleFonts.adventPro(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                width: size.width * 0.03,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Color(0xff0f9914),
            ),
          ),
        ],
      ),
    );
  }
}