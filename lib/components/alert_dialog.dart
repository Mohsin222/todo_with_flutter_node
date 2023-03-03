import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> handleClickMe(BuildContext context, String content) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text('Allow "Maps" to access your location while you use the app?'),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('Don\'t Allow'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('Allow'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}