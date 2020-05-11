import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
          child: Container(
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Premi',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' per tornare indietro'),
                    ],
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
