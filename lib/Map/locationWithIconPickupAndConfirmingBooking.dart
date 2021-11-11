import 'package:flutter/material.dart';

import 'confrimingBookin.dart';
import 'locationWithIconAndPickup.dart';

class LocationWithIconPickupAndConfirmingBooking extends StatelessWidget {
  const LocationWithIconPickupAndConfirmingBooking({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TopExitDrawerbtn(),

          LocationWithIconAndPickup(size: size),
          SizedBox(
            height: size.height * 0.02,
          ),
          ConfirmingBooking(size: size),
        ],
      ),
    );
  }
}
