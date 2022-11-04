import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConnectingProgress extends StatefulWidget {
  const ConnectingProgress({Key? key}) : super(key: key);

  @override
  _ConnectingProgressState createState() => _ConnectingProgressState();
}

class _ConnectingProgressState extends State<ConnectingProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 130,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(
              child: LottieBuilder.asset(
                "assets/lotti/98432-loading.json",
                height: 60,
              ),
            ),
          )
        ],
      ),
    );
  }
}
