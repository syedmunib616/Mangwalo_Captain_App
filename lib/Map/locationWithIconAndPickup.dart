import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationWithIconAndPickup extends StatelessWidget {
  const LocationWithIconAndPickup({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Color(0xd88d8d8d),
                  blurRadius: 10,
                  offset: Offset(4, 8), // Shadow position
                ),
              ]),
          height: size.height * .13,
          width: size.width * .9,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * .1,
                    width: size.width * .7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Markab Cafe",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Sufouh road",
                          style: GoogleFonts.lato(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: size.height * 0.05,
                      width: 1,
                      color: Colors.black),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.launch,
                          color: Colors.green,
                          size: 37,
                        ),
                        Text(
                          "Start",
                          style: GoogleFonts.lato(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: size.height * 0.03,
                decoration: BoxDecoration(
                  color: Color(0x43979797),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Color(0xd88d8d8d),
                  //     blurRadius: 10,
                  //     offset: Offset(4, 8), // Shadow position
                  //   ),
                  // ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.face_outlined),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      "Customer pickup at 9:45 AM",
                      style: GoogleFonts.lato(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
