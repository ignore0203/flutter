import 'package:flutter/material.dart';

class ka1 extends StatelessWidget {
  const ka1({super.key});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('머리 부분'),
      backgroundColor: Colors.lightGreen,),
      body: Column(
        children: [
          Row(
            children: [
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star),
              Icon(Icons.star),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.grey  ,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.phone),
          Icon(Icons.mail),
          Icon(Icons.chat)
        ],
        )
      )
    );
  }
}
