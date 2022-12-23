import 'package:flutter/material.dart';
import 'package:skripsi/home_page.dart';
import 'package:skripsi/reuseable_widgets/reuseable_widget.dart';

class signUp extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signUp> {
  TextEditingController _username = TextEditingController();
  TextEditingController _NPM = TextEditingController();
  TextEditingController _Password = TextEditingController();
  TextEditingController _confrimpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Registrasi',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromARGB(218, 97, 194, 101),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget('assets/image/Logo3.png'),
                SizedBox(
                  height: 10,
                ),
                reuseableTextField(
                    'UserName', Icons.people_outline, false, _username),
                SizedBox(
                  height: 20,
                ),
                reuseableTextField('NPM', Icons.numbers, false, _NPM),
                SizedBox(
                  height: 20,
                ),
                reuseableTextField('password', Icons.password, true, _Password),
                SizedBox(
                  height: 20,
                ),
                reuseableTextField(
                    'Confrim Password', Icons.password, true, _confrimpass),
                SizedBox(
                  height: 20,
                ),
                signinButton(context, false, () {
                  MaterialPageRoute(
                      builder: (context) => homepage(
                            username: '',
                          ));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
