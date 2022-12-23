import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const mybutton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.green),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
