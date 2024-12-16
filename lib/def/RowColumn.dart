import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {
  const RowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Row Column'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  width: 500,
                  height: 500,
                  color: Colors.red,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star),
                        ],
                      )
                    ]

                  )
                ),
                SizedBox(width: 10,),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                )

              ],
            )
          ],
        ),
      )
    );
  }
}
