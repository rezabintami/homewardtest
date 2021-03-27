import 'package:flutter/material.dart';

class VPopup {
  VPopup._();

  static void loadingPopup(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => Center(child: CircularProgressIndicator()),
    );
  }

  static void error(context, message, {title = "UPS", Function callback}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (c) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(title),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(message),
                  ),
                  SizedBox(height: 20.0),
                  Divider(
                    thickness: 0.5,
                    height: 1,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (callback != null) callback();
                    },
                    child: Text("OK"),
                  )
                ],
              ));
        });
  }
}
