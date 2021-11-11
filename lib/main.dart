import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_maps/Authencation/landingpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'Map/locationWithIconPickupAndConfirmingBooking.dart';
import 'Map/yourEarningAndRating.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Maps',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        //home: MyHomePage(title: 'Flutter Map Home Page'));
        // home: CaptainPortal());
        //home: Captains());

        home: Landing());
    //home: SginIn(),  );
    // home:YourEarning());

    //home: Fire());
  }
}

//
// class Fire extends StatefulWidget {
//   const Fire({Key key}) : super(key: key);
//
//   @override
//   _FireState createState() => _FireState();
// }
//
// class _FireState extends State<Fire> {
//   final fb = FirebaseDatabase.instance;
//   var a;
//   var b;
//   String num1;
//   String num2;
//   @override
//   Widget build(BuildContext context) {
//     final ref = fb.reference();
//     final r = fb.reference().child("users");
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             FlatButton(
//                 onPressed: () {
//                   ref
//                       .child("users")
//                       .child("user1")
//                       .child('lat')
//                       .once()
//                       .then((DataSnapshot data) {
//                     setState(() {
//                       a = data.value;
//                       print('${data.value}');
//                     });
//                   });
//                   ref
//                       .child("users")
//                       .child("user1")
//                       .child("lng")
//                       .once()
//                       .then((DataSnapshot data) {
//                     setState(() {
//                       b = data.value;
//                       print("${data.value}");
//                     });
//                   });
//                 },
//                 child: Text("ok")),
//             Text(a.toString()),
//             Text(b.toString()),
//             SizedBox(
//               height: 50,
//             ),
//             TextField(
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//               onChanged: (val) {
//                 num1 = val;
//               },
//             ),
//             TextField(
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//               onChanged: (val) {
//                 num2 = val;
//               },
//             ),
//             FlatButton(
//               onPressed: () {
//                 // r.child("user1").child("lat").set(num);
//                 r.child("user1").set({"lat": num1, "lng": num2});
//               },
//               child: Text("Lat & Lang"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class Driver extends StatefulWidget {
  const Driver({Key key}) : super(key: key);

  @override
  _DriverState createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  final fb = FirebaseDatabase.instance;
  var a;
  var b;
  String num1;
  String num2;

  // getloc() async {
  //   Uint8List imageData = await getMarker();
  //   var location = await _locationTracker.getLocation();
  //   updateMarkerAndCircle(location, imageData);
  //   final r = fb.reference().child("users");
  //   r.child("user1").set({"lat": location.latitude, "lng": location.longitude});
  //   print("guddi corrdinates $num1 $num2");
  // }

  initState() {
    super.initState();
    getCurrentLocation();

    //getloc();
    // setState(() {
    //   num1 = lat.toString();
    //   num2 = lng.toString();
    //   final ref = fb.reference();
    //
    //
    //   //print("guddi corrdinates $num1 $num2");
    // });
  }

  ////////////
  bool ok = false;
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;
  bool chagetheme = false;
  double lat, lng;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(24.860175157177526, 67.0640015602112),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/person.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);

    setState(() {
      lat = latlng.latitude;
      lng = latlng.longitude;
    });

    print("guddi ${lat} $lng");

    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));

      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      final r = fb.reference().child("users");
      r
          .child("user2")
          .set({"lat": location.latitude, "lng": location.longitude});
      // print("guddi corrdinates $num1 $num2");
      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller
              .animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(newLocalData.latitude, newLocalData.longitude),
            tilt: 0,
            zoom: 18.00,
          )));

          // Marker(
          //   markerId: MarkerId("munib"),
          //   position: LatLng(newLocalData.latitude, newLocalData.longitude),
          //   onTap: showAlertDialog(context),
          // );

          updateMarkerAndCircle(newLocalData, imageData);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  Widget build(BuildContext context) {
    final ref = fb.reference();
    final r = fb.reference().child("users");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text(
      //     "Map",
      //     style: GoogleFonts.lato(),
      //   ),
      // ),

      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: chagetheme == false ? MapType.normal : MapType.hybrid,
              initialCameraPosition: initialLocation,
              markers: Set.of((marker != null) ? [marker] : []),
              circles: Set.of((circle != null) ? [circle] : []),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),

            // Positioned(
            //   top: 320,
            //   left: 150,
            //   child: ok != true ? mangwaloButton(context) : Container(),
            // ),

            Positioned(
                right: 10,
                bottom: 120,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (chagetheme == false) {
                            chagetheme = true;
                          } else {
                            chagetheme = false;
                          }
                        });
                      },
                      child: Container(
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
                          height: size.height * 0.05,
                          width: size.width * 0.09,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/earth.png'),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        getCurrentLocation();
                        print("munib $marker");
                      },
                      child: Container(
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
                        height: size.height * 0.05,
                        width: size.width * 0.09,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/currnet.png'),
                        ),
                      ),
                    ),
                  ],
                )),
            Positioned(
              top: 0,
              right: 2,
              left: 2,
              //child:
              //ok != true ? Container() :
              //AppbarLocationAndPKR(size: size),
            ),
            Positioned(
              bottom: 10,
              right: 70,
              //child:
              //ok != true ? Container() :
              // bottomBtnWithFares(size),
            ),
          ],
        ),
      ),
    );
  }

  // Container bottomBtnWithFares(Size size) {
  //   return Container(
  //     height: size.height * 0.15,
  //     width: size.width * 0.73,
  //     //color: Colors.red,
  //     child: Column(
  //       children: [
  //         Container(
  //           decoration: BoxDecoration(
  //             color: Color(0xff222323),
  //             borderRadius: BorderRadius.circular(20.0),
  //             // boxShadow: [
  //             //   BoxShadow(
  //             //     color: Colors.grey,
  //             //     blurRadius: 10,
  //             //     offset: Offset(4, 8), // Shadow position
  //             //   ),
  //             // ]
  //           ),
  //           height: size.height * 0.08,
  //           width: size.width * 0.6,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: Icon(
  //                   Icons.stacked_line_chart_sharp,
  //                   size: 22,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //               Text(
  //                 "It's busy. Fares are \n higher than usual ",
  //                 style: GoogleFonts.lato(fontSize: 19, color: Colors.white),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: Icon(
  //                   Icons.info_outline_rounded,
  //                   size: 22,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         GestureDetector(
  //             onTap: () {
  //               getCurrentLocation();
  //             },
  //             child: Container(
  //               decoration: BoxDecoration(
  //                   color: Color(0xff23a300),
  //                   borderRadius: BorderRadius.circular(20.0),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.grey,
  //                       blurRadius: 10,
  //                       offset: Offset(4, 8), // Shadow position
  //                     ),
  //                   ]),
  //               height: size.height * 0.05,
  //               width: size.width * 0.7,
  //               child: Center(
  //                 child: Text(
  //                   "Conform Pickup",
  //                   style: GoogleFonts.lato(
  //                       fontSize: 17, fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             ))
  //       ],
  //     ),
  //   );
  // }

  GestureDetector mangwaloButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAlertDialog(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xCEE58100),
          borderRadius: BorderRadius.circular(40.0),

          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     blurRadius: 10,
          //     offset: Offset(4, 8), // Shadow position
          //   ),
          // ]
        ),
        height: MediaQuery.of(context).size.height * 0.190,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset("assets/1.png"),
              Text(
                "Tap for Mangwalo",
                style: GoogleFonts.dekko(
                    fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => GoogleMapScreen()));
        setState(() {
          ok = true;
          Navigator.pop(context);
        });
      },
    );

    Widget cencel = FlatButton(
      child: Text("Cencel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(
        children: [
          Text(
            "Dunhill, ",
            style: GoogleFonts.patuaOne(),
          ),
          Text(
            "Marlboro, ",
            style: GoogleFonts.patuaOne(),
          ),
          Text(
            "Captain Black",
            style: GoogleFonts.patuaOne(),
          ),
        ],
      ),
      // content: TextFormField(),
      actions: [okButton, cencel],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.user}) : super(key: key);
  final String title;
  final String user;
  User usermap;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fb = FirebaseDatabase.instance;
  var a;
  var b;
  String num1;
  String num2;
  bool arrived = false;
  bool submit = false;
  String arr = "guddi ki";
  String sub = "guddi";

  // getloc() async {
  //   Uint8List imageData = await getMarker();
  //   var location = await _locationTracker.getLocation();
  //   updateMarkerAndCircle(location, imageData);
  //   final r = fb.reference().child("users");
  //   r.child("user1").set({"lat": location.latitude, "lng": location.longitude});
  //   print("guddi corrdinates $num1 $num2");
  // }

  initState() {
    super.initState();
    getCurrentLocation();
    delay();
    //getloc();
    // setState(() {
    //   num1 = lat.toString();
    //   num2 = lng.toString();
    //   final ref = fb.reference();
    //
    //
    //   //print("guddi corrdinates $num1 $num2");
    // });
  }

  delay() async {
    for (int i = 0; i < 100000000000000000; i++) {
      final q = await Future.delayed(Duration(seconds: 2), () {
        print("${[i]}");
        getCurrentLocation();
      });
      i++;
    }
  }

  ////////////

  bool ok = false;
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;
  bool chagetheme = false;
  double lat, lng;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(24.860175157177526, 67.0640015602112),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/car.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    setState(() {
      lat = latlng.latitude;
      lng = latlng.longitude;
    });
    print("guddi ${lat} $lng");

    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));

      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      updateMarkerAndCircle(location, imageData);
      final r = fb.reference().child("users").child("drivers");
      r
          .child(widget.user)
          .set({"lat": location.latitude, "lng": location.longitude});
      print("guddi corrdinates $num1 $num2");
      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller
              .animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(newLocalData.latitude, newLocalData.longitude),
            tilt: 0,
            zoom: 18.00,
          )));

          // Marker(
          //   markerId: MarkerId("munib"),
          //   position: LatLng(newLocalData.latitude, newLocalData.longitude),
          //   onTap: showAlertDialog(context),
          // );

          updateMarkerAndCircle(newLocalData, imageData);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  Widget build(BuildContext context) {
    final ref = fb.reference();
    final r = fb.reference().child("users");
    Size size = MediaQuery.of(context).size;
    print("userMapFirebase ${widget.user}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "",
          style: GoogleFonts.lato(),
        ),
        leading: MaterialButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SginIn()));
            dispose();
          },
          child: Icon(Icons.logout),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: chagetheme == false ? MapType.normal : MapType.hybrid,
              initialCameraPosition: initialLocation,
              markers: Set.of((marker != null) ? [marker] : []),
              circles: Set.of((circle != null) ? [circle] : []),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),

            // Positioned(
            //   bottom: 10,
            //   left: 10,
            //   right: 10,
            //   child: Container(
            //     height: size.height * 0.32,
            //     child: Column(
            //       children: [
            //         YourEarning(size: size),
            //         SizedBox(
            //           height: size.height * 0.017,
            //         ),
            //         YourEarningAndRating(size: size),
            //         SizedBox(
            //           height: size.height * 0.017,
            //         ),
            //         Container(
            //           height: size.height * 0.06,
            //           decoration: BoxDecoration(
            //               color: Color(0xff23a300),
            //               borderRadius: BorderRadius.circular(20.0),
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey,
            //                   blurRadius: 10,
            //                   offset: Offset(4, 8), // Shadow position
            //                 ),
            //               ]),
            //           child: Center(
            //             child: Text(
            //               "Finish",
            //               style: GoogleFonts.lato(
            //                   fontSize: 22, fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),

            arr == "guddi ki"
                ? Container()
                : Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      height: size.height * 0.37,
                      //color: Colors.red,
                      child: Column(
                        children: [
                          Container(
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
                                Container(
                                  height: size.height * .07,
                                  width: size.width * .8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Collect cash",
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "from Mohammad Imran",
                                        style: GoogleFonts.lato(
                                          color: Colors.grey,
                                          fontSize: 18,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    height: size.height * 0.06,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Total Fare",
                                          style: GoogleFonts.lato(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          "Rs 560",
                                          style: GoogleFonts.lato(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        Icon(Icons.arrow_circle_down)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
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
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25, top: 10, bottom: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Enter amount collected",
                                    style: GoogleFonts.lato(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  TextField(
                                    decoration: InputDecoration(
                                        labelText: "Enter your number",
                                        labelStyle: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ], // Only numbers can be entered
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.0155,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sub == "guddi bhen ki";
                                arr == "guddi";
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff0f9914),
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xd88d8d8d),
                                      blurRadius: 10,
                                      offset: Offset(4, 8), // Shadow position
                                    ),
                                  ]),
                              height: size.height * 0.06,
                              width: size.width * 0.8,
                              child: Center(
                                child: Text(
                                  "Submit",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),

            // Positioned(
            //   top: 320,
            //   left: 150,
            //   child: ok != true ? mangwaloButton(context) : Container(),
            // ),

            sub == "guddi bhen ki"
                ? Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: YourEarningAndRating(
                      size: size,
                    ))
                : Container(),

            arr == "guddi ki"
                ? Positioned(
                    right: 10,
                    bottom: 120,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (chagetheme == false) {
                                chagetheme = true;
                              } else {
                                chagetheme = false;
                              }
                            });
                          },
                          child: Container(
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
                              height: size.height * 0.05,
                              width: size.width * 0.09,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/earth.png'),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            getCurrentLocation();
                            print("munib $marker");
                          },
                          child: Container(
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
                            height: size.height * 0.05,
                            width: size.width * 0.09,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/currnet.png'),
                            ),
                          ),
                        ),
                      ],
                    ))
                : Container(),

            arr == "guddi ki"
                ? Positioned(
                    top: 0,
                    right: 2,
                    left: 2,
                    child:
                        //ok != true ? Container() :
                        LocationWithIconPickupAndConfirmingBooking(size: size),
                  )
                : Container(),

            arr == "guddi ki"
                ? Positioned(
                    bottom: 25,
                    right: 25,
                    child:
                        //ok != true ? Container() :
                        bottomBtnWithFares(size),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Container bottomBtnWithFares(Size size) {
    return Container(
      height: size.height * 0.05,
      width: size.width * 0.89,
      //color: Colors.red,

      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                getCurrentLocation();
                setState(() {
                  arr = "guddi";
                  arrived = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff23a300),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ]),
                height: size.height * 0.06,
                width: size.width * 0.75,
                child: Center(
                  child: Text(
                    "Arrived for pickup",
                    style: GoogleFonts.lato(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          SizedBox(
            width: size.width * 0.03,
          ),
          Container(
            height: size.height * 0.06,
            width: size.width * 0.1,
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(4, 8), // Shadow position
                  ),
                ]),
            child: Center(
                child: Icon(
              Icons.message_rounded,
              size: 25,
            )),
          ),
        ],
      ),
    );
  }

  // GestureDetector mangwaloButton(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () {
  //       showAlertDialog(context);
  //     },
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: Color(0xCEE58100),
  //         borderRadius: BorderRadius.circular(40.0),
  //         // boxShadow: [
  //         //   BoxShadow(
  //         //     color: Colors.grey,
  //         //     blurRadius: 10,
  //         //     offset: Offset(4, 8), // Shadow position
  //         //   ),
  //         // ]
  //       ),
  //       height: MediaQuery.of(context).size.height * 0.190,
  //       width: MediaQuery.of(context).size.width * 0.3,
  //       child: Padding(
  //         padding: const EdgeInsets.all(10.0),
  //         child: Column(
  //           children: [
  //             Image.asset("assets/1.png"),
  //             Text(
  //               "Tap for Mangwalo",
  //               style: GoogleFonts.dekko(
  //                   fontSize: 15, fontWeight: FontWeight.bold),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // showAlertDialog(BuildContext context) {
  //   // set up the button
  //   Widget okButton = FlatButton(
  //     child: Text("OK"),
  //     onPressed: () {
  //       // Navigator.push(context,
  //       //     MaterialPageRoute(builder: (context) => GoogleMapScreen()));
  //       setState(() {
  //         ok = true;
  //         Navigator.pop(context);
  //       });
  //     },
  //   );
  //
  //   Widget cencel = FlatButton(
  //     child: Text("Cencel"),
  //     onPressed: () {
  //       Navigator.pop(context);
  //     },
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Row(
  //       children: [
  //         Text(
  //           "Dunhill, ",
  //           style: GoogleFonts.patuaOne(),
  //         ),
  //         Text(
  //           "Marlboro, ",
  //           style: GoogleFonts.patuaOne(),
  //         ),
  //         Text(
  //           "Captain Black",
  //           style: GoogleFonts.patuaOne(),
  //         ),
  //       ],
  //     ),
  //     // content: TextFormField(),
  //     actions: [okButton, cencel],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

}

class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  final fb = FirebaseDatabase.instance;
  var a;
  var b;
  String num1;
  String num2;
  bool arrived = false;
  bool submit = false;
  String arr = "guddi ki";
  String sub = "guddi";

  // getloc() async {
  //   Uint8List imageData = await getMarker();
  //   var location = await _locationTracker.getLocation();
  //   updateMarkerAndCircle(location, imageData);
  //   final r = fb.reference().child("users");
  //   r.child("user1").set({"lat": location.latitude, "lng": location.longitude});
  //   print("guddi corrdinates $num1 $num2");
  // }

  initState() {
    super.initState();
    getCurrentLocation();
    delay();
    // for (int i = 0; i < 100000000000000000; i++) {
    //   getCurrentLocation();
    //   return i++;
    // }

    //getloc();
    // setState(() {
    //   num1 = lat.toString();
    //   num2 = lng.toString();
    //   final ref = fb.reference();
    //
    //
    //   //print("guddi corrdinates $num1 $num2");
    // });
  }

  delay() async {
    for (int i = 0; i < 100000000000000000; i++) {
      final q = await Future.delayed(Duration(seconds: 1), () {
        print("${[i]}");
        getCurrentLocation();
      });
      i++;
    }
  }

  ////////////

  bool ok = false;
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;
  bool chagetheme = false;
  double lat, lng;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(24.860175157177526, 67.0640015602112),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/car.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    setState(() {
      lat = latlng.latitude;
      lng = latlng.longitude;
    });
    print("guddi ${lat} $lng");

    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));

      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      updateMarkerAndCircle(location, imageData);
      final r = fb.reference().child("users");
      r
          .child("user3")
          .set({"lat": location.latitude, "lng": location.longitude});
      //print("guddi corrdinates $num1 $num2");
      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller
              .animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(newLocalData.latitude, newLocalData.longitude),
            tilt: 0,
            zoom: 18.00,
          )));

          // Marker(
          //   markerId: MarkerId("munib"),
          //   position: LatLng(newLocalData.latitude, newLocalData.longitude),
          //   onTap: showAlertDialog(context),
          // );

          updateMarkerAndCircle(newLocalData, imageData);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  Widget build(BuildContext context) {
    final ref = fb.reference();
    final r = fb.reference().child("users");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text(
      //     "Map",
      //     style: GoogleFonts.lato(),
      //   ),
      // ),

      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: chagetheme == false ? MapType.normal : MapType.hybrid,
              initialCameraPosition: initialLocation,
              markers: Set.of((marker != null) ? [marker] : []),
              circles: Set.of((circle != null) ? [circle] : []),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),

            // Positioned(
            //   bottom: 10,
            //   left: 10,
            //   right: 10,
            //   child: Container(
            //     height: size.height * 0.32,
            //     child: Column(
            //       children: [
            //         YourEarning(size: size),
            //         SizedBox(
            //           height: size.height * 0.017,
            //         ),
            //         YourEarningAndRating(size: size),
            //         SizedBox(
            //           height: size.height * 0.017,
            //         ),
            //         Container(
            //           height: size.height * 0.06,
            //           decoration: BoxDecoration(
            //               color: Color(0xff23a300),
            //               borderRadius: BorderRadius.circular(20.0),
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey,
            //                   blurRadius: 10,
            //                   offset: Offset(4, 8), // Shadow position
            //                 ),
            //               ]),
            //           child: Center(
            //             child: Text(
            //               "Finish",
            //               style: GoogleFonts.lato(
            //                   fontSize: 22, fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),

            arr == "guddi ki"
                ? Container()
                : Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      height: size.height * 0.37,
                      //color: Colors.red,
                      child: Column(
                        children: [
                          Container(
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
                                Container(
                                  height: size.height * .07,
                                  width: size.width * .8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Collect cash",
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "from Mohammad Imran",
                                        style: GoogleFonts.lato(
                                          color: Colors.grey,
                                          fontSize: 18,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    height: size.height * 0.06,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Total Fare",
                                          style: GoogleFonts.lato(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          "Rs 560",
                                          style: GoogleFonts.lato(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        Icon(Icons.arrow_circle_down)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
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
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25, top: 10, bottom: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Enter amount collected",
                                    style: GoogleFonts.lato(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  TextField(
                                    decoration: InputDecoration(
                                        labelText: "Enter your number",
                                        labelStyle: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ], // Only numbers can be entered
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.0155,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sub == "guddi bhen ki";
                                arr == "guddi";
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff0f9914),
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xd88d8d8d),
                                      blurRadius: 10,
                                      offset: Offset(4, 8), // Shadow position
                                    ),
                                  ]),
                              height: size.height * 0.06,
                              width: size.width * 0.8,
                              child: Center(
                                child: Text(
                                  "Submit",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),

            // Positioned(
            //   top: 320,
            //   left: 150,
            //   child: ok != true ? mangwaloButton(context) : Container(),
            // ),

            sub == "guddi bhen ki"
                ? Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: YourEarningAndRating(
                      size: size,
                    ))
                : Container(),

            arr == "guddi ki"
                ? Positioned(
                    right: 10,
                    bottom: 120,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (chagetheme == false) {
                                chagetheme = true;
                              } else {
                                chagetheme = false;
                              }
                            });
                          },
                          child: Container(
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
                              height: size.height * 0.05,
                              width: size.width * 0.09,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/earth.png'),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            getCurrentLocation();
                            print("munib $marker");
                          },
                          child: Container(
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
                            height: size.height * 0.05,
                            width: size.width * 0.09,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/currnet.png'),
                            ),
                          ),
                        ),
                      ],
                    ))
                : Container(),

            arr == "guddi ki"
                ? Positioned(
                    top: 0,
                    right: 2,
                    left: 2,
                    child:
                        //ok != true ? Container() :
                        LocationWithIconPickupAndConfirmingBooking(size: size),
                  )
                : Container(),

            arr == "guddi ki"
                ? Positioned(
                    bottom: 25,
                    right: 25,
                    child:
                        //ok != true ? Container() :
                        bottomBtnWithFares(size),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Container bottomBtnWithFares(Size size) {
    return Container(
      height: size.height * 0.05,
      width: size.width * 0.89,
      //color: Colors.red,

      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                getCurrentLocation();
                setState(() {
                  arr = "guddi";
                  arrived = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff23a300),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ]),
                height: size.height * 0.06,
                width: size.width * 0.75,
                child: Center(
                  child: Text(
                    "Arrived for pickup",
                    style: GoogleFonts.lato(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          SizedBox(
            width: size.width * 0.03,
          ),
          Container(
            height: size.height * 0.06,
            width: size.width * 0.1,
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(4, 8), // Shadow position
                  ),
                ]),
            child: Center(
                child: Icon(
              Icons.message_rounded,
              size: 25,
            )),
          ),
        ],
      ),
    );
  }

// GestureDetector mangwaloButton(BuildContext context) {
//   return GestureDetector(
//     onTap: () {
//       showAlertDialog(context);
//     },
//     child: Container(
//       decoration: BoxDecoration(
//         color: Color(0xCEE58100),
//         borderRadius: BorderRadius.circular(40.0),
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Colors.grey,
//         //     blurRadius: 10,
//         //     offset: Offset(4, 8), // Shadow position
//         //   ),
//         // ]
//       ),
//       height: MediaQuery.of(context).size.height * 0.190,
//       width: MediaQuery.of(context).size.width * 0.3,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Image.asset("assets/1.png"),
//             Text(
//               "Tap for Mangwalo",
//               style: GoogleFonts.dekko(
//                   fontSize: 15, fontWeight: FontWeight.bold),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
// showAlertDialog(BuildContext context) {
//   // set up the button
//   Widget okButton = FlatButton(
//     child: Text("OK"),
//     onPressed: () {
//       // Navigator.push(context,
//       //     MaterialPageRoute(builder: (context) => GoogleMapScreen()));
//       setState(() {
//         ok = true;
//         Navigator.pop(context);
//       });
//     },
//   );
//
//   Widget cencel = FlatButton(
//     child: Text("Cencel"),
//     onPressed: () {
//       Navigator.pop(context);
//     },
//   );
//
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Row(
//       children: [
//         Text(
//           "Dunhill, ",
//           style: GoogleFonts.patuaOne(),
//         ),
//         Text(
//           "Marlboro, ",
//           style: GoogleFonts.patuaOne(),
//         ),
//         Text(
//           "Captain Black",
//           style: GoogleFonts.patuaOne(),
//         ),
//       ],
//     ),
//     // content: TextFormField(),
//     actions: [okButton, cencel],
//   );
//
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

}

class Captains extends StatelessWidget {
  const Captains({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              color: Colors.green,
              child: Text("Captain 1"),
            ),
            SizedBox(
              width: 30,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage1()));
                print("chal ja");
              },
              color: Colors.blue,
              child: Text("Captain 2"),
            ),
          ],
        ),
      ),
    );
  }
}

// class TopExitDrawerbtn extends StatelessWidget {
//   const TopExitDrawerbtn({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Row(
//       children: [
//         GestureDetector(
//           child: Container(
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey,
//                     blurRadius: 10,
//                     offset: Offset(4, 8), // Shadow position
//                   ),
//                 ]),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.clear,
//                 size: 35,
//               ),
//             ),
//           ),
//         ),
//         Spacer(),
//         Text(
//           'Select pickup location',
//           style:
//               GoogleFonts.newsCycle(fontSize: 28, fontWeight: FontWeight.bold),
//         ),
//         Spacer(),
//         GestureDetector(
//           child: Container(
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey,
//                     blurRadius: 10,
//                     offset: Offset(4, 8), // Shadow position
//                   ),
//                 ]),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.menu,
//                 size: 35,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
