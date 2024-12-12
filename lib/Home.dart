import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('머리 부분'),),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              print('HI ');
              Navigator.pushNamed(context,'/def');
            }, child: Text('기본 Widget'))
          ],
        )
      ),
      bottomNavigationBar: Text('Botoom 부분'),
    );
  }
}
