import 'package:flutter/material.dart';

//
// to use this class ->
// showDialog(context: context, builder: (context) => WarningPopUp(name: value['name'])).then((value) {
// value['name'] = value;
// });
//
class WarningPopUp extends StatefulWidget {
  final String warning;
  final String title;
  const WarningPopUp({
    Key? key,
    required this.title,
    required this.warning,
  }) : super(key: key);

  @override
  _WarningPopUpState createState() => _WarningPopUpState();
}

class _WarningPopUpState extends State<WarningPopUp> {
  String nameValue = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(
            Icons.warning_amber_outlined,
            color: Colors.orange,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
      content: Text(
        widget.warning,
        style: const TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("OK"),
        )
      ],
    );
  }
}
