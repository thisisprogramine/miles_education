

import 'package:flutter/material.dart';

import '../presentation/widget/button.dart';

enum CompactFormat {Hundred, Thousand, Million, Lack, Billion, Crore}

class AppHelpers {
  static Future<bool> onWillPop(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        content: Text("Are you sure?",
            style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: <Widget>[
          Button(
            onPressed: () => Navigator.of(context).pop(false),
            text: 'NO',
          ),
          Button(
            onPressed: () => Navigator.of(context).pop(true),
            // onPressed: () {
            //   SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            // },
            text: 'YES',
          ),
        ],
      ),
    ) ??
        false;
  }
}