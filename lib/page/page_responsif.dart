import 'package:flutter/material.dart';

class PageResponsif extends StatelessWidget {
  const PageResponsif({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Text(
            'View\n\n' +
                '[Media Query width: ${screenSize.width.toStringAsFixed(2)}]\n\n' +
                '[Media Query Orientation] : ${orientation}',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class PageResponsifLayoutBuilder extends StatelessWidget {
  const PageResponsifLayoutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    Size screnSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: LayoutBuilder(
                builder: (context,contsraints)=>Container(
                  color: Colors.red,
                  child: Center(
                  child: Text(
                        '[Layout Builder width: ${contsraints.maxWidth.toStringAsFixed(2)}]\n\n'+
                            '[Media Query width: ${screnSize.width.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                ),
            ),
          )
        ],
      ),
    );

  }
}
