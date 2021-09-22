import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locategeouser/models/create_model.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:cron/cron.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Future<CreateUserRequest> createUser(
    String name, String latitude, String longitude) async {
  final String apiUrl = 'http://api.staging.tarsoft.co/api/coordinates/create';

  final response = await http.post(Uri.parse('$apiUrl'),
      body: {'name': name, 'latitude': latitude, 'longitude': longitude});
  if (response.statusCode == 200 || response.statusCode == 500) {
    print(response.statusCode);
    print(response.body);
    return CreateUserRequest.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<void> main() async {
  final cron = Cron()
    ..schedule(Schedule.parse('*/6 * * * * *'), () {
      print(DateTime.now());
    });
  await Future.delayed(Duration(seconds: 10));
  await cron.close();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = new TextEditingController();
  final latController = new TextEditingController();
  final longController = new TextEditingController();

  late CreateUserRequest _user;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _user = new CreateUserRequest();
  }

  @override
  Widget build(BuildContext context) {
    longController.text = '${_currentPosition?.longitude}';
    latController.text = '${_currentPosition?.latitude}';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Locating user location',
          style: GoogleFonts.varela(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    child: Text(
                        'Enable your location ! \nFor new live shipping experience',
                        style: GoogleFonts.varela(
                          fontSize: 15,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 80),
                  child: Lottie.asset(
                    'assets/lottie/delivery.json',
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Container(
                    margin: EdgeInsets.only(top: 300),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            onSaved: (input) =>
                                _user.data = input as DataResponse?,
                            controller: nameController,
                            decoration:
                                InputDecoration(labelText: 'Enter your name'),
                          ),
                          TextFormField(
                            enabled: false,
                            controller: longController,
                            decoration:
                                InputDecoration(labelText: 'Your longitude'),
                          ),
                          TextFormField(
                            enabled: false,
                            controller: latController,
                            decoration:
                                InputDecoration(labelText: 'Your latitude'),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Container(
                  margin: EdgeInsets.only(top: 535),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // if (_currentPosition != null)
                      //   Text(
                      //       'Longitude: ${_currentPosition!.longitude} \nLatitude: ${_currentPosition!.latitude}'),
                      SizedBox(height: 15),
                      TextButton(
                        child: Text('Get Location'),
                        onPressed: () {
                          _getCurrentLocation();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 500),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: TextButton(
                        onPressed: () async {
                            final cron = Cron()
                        ..schedule(Schedule.parse('*/10 * * * * *'), () async {
                          final String name = nameController.text;
                          final String latitude = latController.text;
                          final String longitude = longController.text;
                          final CreateUserRequest user =
                              await createUser(name, latitude, longitude);
                          setState(() {
                            _user = user;
                          });
                        print(DateTime.now());
                        });
                        await Future.delayed(Duration(days: 1));
                        await cron.close();
                        },
                        child: Text(
                          'Start Shipping',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  void schedule(Schedule schedule, Null Function() param1) {}
}
