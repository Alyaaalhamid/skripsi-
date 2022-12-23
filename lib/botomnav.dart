import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavItem extends StatelessWidget {
  final String svgSrc;
  final VoidCallback press;
  final String title;
  const BottomNavItem({
    Key? key,
    required this.svgSrc,
    required this.press,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var colorpallete;
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgSrc,
            height: 20,
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 13),
          )
        ],
      ),
    );
  }
}
