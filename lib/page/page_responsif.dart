import 'package:flutter/material.dart';

class PageResponsif extends StatelessWidget {
  const PageResponsif({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;

    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Text(
            'View\n\n' +
                '[Media Query width: ${screenSize.width.toStringAsFixed(
                    2)}]\n\n' +
                '[Media Query Orientation] : ${orientation}',
            style: TextStyle(
                color: Colors.white, fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}


