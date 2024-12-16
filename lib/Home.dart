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
            }, child: Text('기본 Widget')),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              print('HI ');
              Navigator.pushNamed(context,'/rowColumn');
            }, child: Text('Row Column사용')),
            ElevatedButton(onPressed: () {
              print('HI ');
              Navigator.pushNamed(context,'/ka1');
            }, child: Text('ka1')),
          ],
        )
      ),
      bottomNavigationBar: Text('Botoom 부분'),
    );
  }
}
