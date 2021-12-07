// ignore_for_file: file_names
import "package:flutter/material.dart";

class ReuseableWidgetTwo extends StatelessWidget {
  final width;
  final height;
  Widget childCardTwo;

  ReuseableWidgetTwo(
      {Key? key, this.width, this.height, required this.childCardTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right:8,bottom:8,top:8),
          child: Container(
            child: childCardTwo,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
      ),
    );
  }
}
