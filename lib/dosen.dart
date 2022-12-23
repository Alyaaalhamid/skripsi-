import 'package:flutter/material.dart';
import 'package:skripsi/Component_dosen/Body.dart';
import 'package:skripsi/botomnav.dart';
//import 'package:skripsi/home_page.dart';
//import 'package:skripsi/main.dart';
//import 'package:skripsi/model/color_pallete.dart';

class dosen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: body(),
      backgroundColor: Color(0xff82C695),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
        height: 75,
        decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomNavItem(
              svgSrc: 'assets/icons/home-2502.svg',
              title: 'Home',
              press: () {},
            ),
            BottomNavItem(
              svgSrc: 'assets/icons/bell-860.svg',
              title: 'Notifikasi',
              press: () {},
            ),
            BottomNavItem(
              svgSrc: 'assets/icons/userdalem.svg',
              title: 'User',
              press: () {},
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff82C695),
      elevation: 0,
      automaticallyImplyLeading: true,
      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back_ios),
      //   onPressed: () {

      //   },
      // ),
      title: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 100,
        ),
        child: Text('Dosen'),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
