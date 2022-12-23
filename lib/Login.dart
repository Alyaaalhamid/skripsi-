import 'dart:convert';
//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:skripsi/home_page.dart';
import 'package:skripsi/main.dart';
import 'package:skripsi/model/color_pallete.dart';
import 'package:skripsi/reuseable_widgets/reuseable_widget.dart';
import 'package:skripsi/signup.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  _loginscreen createState() => _loginscreen();
}

class _loginscreen extends State<Login> {
  bool isRememberME = false;
  TextEditingController NPM = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String msg = '';

  //Future _login() async {
  //final response = await http.post(
  //Uri.parse('http://192.168.132.2/skripsi/login.php'),
  //  body: {'username': user.text, 'password': pass.text});
  //var datauser = json.decode(response.body);
  //if (datauser.length == 0) {
  // setState(() {
  //msg = 'Login Fail';
  //});
  //} else {
  //if (datauser[0]['level'] == 'Home') {
  //print('welcome');
  //Navigator.pushReplacementNamed(context, '/Homepage');
  //}
  //}
  //}
  //Future<InternetAddress> get selfIP async {
  //String ip = await Wifi.ip;
  //return InternetAddress(ip)
  //}

  Future _login() async {
    final response = await http
        .post(Uri.parse('http://192.168.100.69/skripsi/login.php'), body: {
      'NPM': NPM.text,
      'Password': pass.text,
    });
    //print(response.body);
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      setState(() {
        msg = 'Login Failed';
      });
    } else {
      if (datauser[0]['level'] == 'User') {
        //Navigator.pushReplacementNamed(context, '/hompage');
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new homepage(
              username: username,
            ),
          ),
        );
      }
      setState(() {
        username = datauser[0]['username'];
      });
    }
    return datauser;
  }

  Widget buildUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white10, borderRadius: BorderRadius.circular(30)),
          height: 60,
          child: TextField(
            controller: NPM,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.people_outline,
                  color: Colors.black38,
                ),
                hintText: 'NPM',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white10, borderRadius: BorderRadius.circular(30)),
          height: 60,
          child: TextField(
            controller: pass,
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: Colors.black38,
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Pressed'),
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildRemember() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black38),
            child: Checkbox(
                value: isRememberME,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    isRememberME = value!;
                  });
                }),
          ),
          Text(
            'Remember Me',
            style:
                TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildLoginbtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: RaisedButton(
          elevation: 5,
          onPressed: () {
            // _login();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => homepage(username: username)));
          },
          //style: ElevatedButton.styleFrom(
          // shape:
          ///   RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          //foregroundColor: Color(0xff30A04F),
          //),
          padding: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Color(0xff30A04F),
          child: Text(
            'LOG IN',
            style: TextStyle(
                color: Colors.black38,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
    Text(
      msg,
      style: TextStyle(fontSize: 20, color: Colors.black38),
    );
  }

  Widget buildSignUp() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => signUp()));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account?',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(218, 97, 194, 101),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      colorpallete.myarPrimary,
                      colorpallete.myarSekunder,
                      colorpallete.myargradasi
                    ])),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      logoWidget('assets/images/Logo3.png'),
                      SizedBox(height: 10),
                      Text(
                        'Login To Your Account !',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      buildUsername(),
                      SizedBox(
                        height: 20,
                      ),
                      buildPassword(),
                      SizedBox(
                        height: 10,
                      ),
                      buildForgotPassword(),
                      SizedBox(
                        height: 10,
                      ),
                      buildRemember(),
                      SizedBox(
                        height: 15,
                      ),
                      buildLoginbtn(),
                      SizedBox(
                        height: 15,
                      ),
                      buildSignUp(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
