import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skripsi/Widgets/CategoryCars.dart';
import 'package:skripsi/botomnav.dart';
import 'package:skripsi/distribusi/add_edit_distribusi.dart';
//import 'package:skripsi/distribusi.dart';
//import 'package:skripsi/distribusi/distribut.dart';
import 'package:skripsi/distribusi/home_distribusi.dart';
//import 'package:skripsi/distribut/distribusimatkul.dart';
import 'package:skripsi/dosen.dart';
import 'package:skripsi/schedulenotif/jadwal.dart';
import 'package:skripsi/model/color_pallete.dart';
import 'package:skripsi/profile.dart';

class homepage extends StatelessWidget {
  homepage({required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
        height: 80,
        decoration: BoxDecoration(
            color: colorpallete.myarbotomnv,
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
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .40,
            decoration: BoxDecoration(
                color: colorpallete.myarbotomnv,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: colorpallete.myargradasi,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('assets/icons/setting-lines.svg',
                          height: 30,
                          width: 30,
                          fit: BoxFit.scaleDown,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Welcome $username !',
                    style: TextStyle(
                        color: colorpallete.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Selamat datang Di aplikasi MyAR ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.normal),
                  ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 10),
                  //   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white38,
                  //     borderRadius: BorderRadius.circular(29.5),
                  //   ),
                  //   child: Text('Hari Ini Ada Jadwal ya !'),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 20),
                  //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white38,
                  //       borderRadius: BorderRadius.circular(25)),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         hintText: 'Search',
                  //         icon: SvgPicture.asset(
                  //           'assets/icons/search.svg',
                  //           height: 18,
                  //           width: 18,
                  //           fit: BoxFit.scaleDown,
                  //         ),
                  //         border: InputBorder.none),
                  //   ),
                  // ),
                  SizedBox(height: 200),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .98,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: 'Dosen',
                          SvgSrc: 'assets/icons/man2.svg',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => dosen()),
                            );
                          },
                        ),
                        CategoryCard(
                          title: 'Jadwal',
                          SvgSrc: 'assets/icons/presentation.svg',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => calendar()),
                            );
                          },
                        ),
                        CategoryCard(
                          title: 'Distribusi Matakuliah',
                          SvgSrc: 'assets/icons/open-book.svg',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeDistribusi(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
