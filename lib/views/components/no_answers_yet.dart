import 'package:flutter/material.dart';

class NoAnswersYet extends StatefulWidget {
  const NoAnswersYet({Key? key}) : super(key: key);

  @override
  State<NoAnswersYet> createState() => _NoAnswersYetState();
}

class _NoAnswersYetState extends State<NoAnswersYet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(

        ///
        ///
        ///
        /// Question has no answers
        child: Container(
      width: size.width / 2,
      height: 60,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.white24,
              blurRadius: 2,
              spreadRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
            Colors.white60,
            Colors.white70,
          ])),
      child: Center(
          child: Text(
        "Not Answered Yet".toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      )),
    ));
  }
}
