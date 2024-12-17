import 'package:flutter/material.dart';

class Con2 extends StatelessWidget {
  const Con2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        backgroundColor: Color(0xffACE3E1),
        body: SafeArea(child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              //윗 동네
              _Top(),

              //아랫 동네
              _Img(),
            ],
          )
        )),
      ),
    );
  }
}


class _Top extends StatelessWidget {
  const _Top({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Text('U&I', style: TextStyle(
              fontFamily: 'perisienne',
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),),



            Text('우리가 처음 만난 날',
            style: TextStyle(
              fontFamily: 'sunflower',
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),),
            Text('2024.12.13'),
            SizedBox(height: 16,),
            IconButton(onPressed: () {

            }, icon: Icon(Icons.favorite, color: Colors.red,)),
            SizedBox(height: 16,),
            Text('D+100')
          ],
        )
    );
  }
}


class _Img extends StatelessWidget {
  const _Img({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('dog.jpg',
        height: MediaQuery.of(context).size.height / 2,),
    );
  }
}
