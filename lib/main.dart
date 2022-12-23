import 'dart:async';

//import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi/Login.dart';
import 'package:skripsi/home_page.dart';
import 'package:skripsi/reuseable_widgets/reuseable_widget.dart';
import 'package:skripsi/schedulenotif/db_helper.dart';

String username = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await taskHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: splashscreen(),
        routes: <String, WidgetBuilder>{
          '/Homepage': (BuildContext context) => new homepage(
                username: username,
              ),
        });
  }
}

class splashscreen extends StatefulWidget {
  _splashscreen createState() => _splashscreen();
}

class _splashscreen extends State<splashscreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => homepage(
                  username: '',
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(218, 97, 194, 101),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[logoWidget('assets/images/Logo3.png')],
        ),
      ),
    );
  }
}
