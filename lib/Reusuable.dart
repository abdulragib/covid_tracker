// ignore_for_file: file_names

import "package:flutter/material.dart";

class ReuseableWidget extends StatelessWidget {
  final width;
  final height;
  Widget childCard;

  ReuseableWidget({Key? key, this.width, this.height, required this.childCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:2,
      child: Padding(
        padding: const EdgeInsets.all( 8.0),
        child: Container(
          child: childCard,
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
