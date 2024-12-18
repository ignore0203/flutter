import 'package:flutter/material.dart';

class Con2 extends StatelessWidget {
  const Con2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffACE3E1),
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //윗 동네
                _Top(),

                //아랫 동네
                _Img(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Top extends StatefulWidget {
  const _Top({super.key});

  @override
  State<_Top> createState() => _TopState();
}

class _TopState extends State<_Top> {
  int likeCount = 0;  // 좋아요 수

  // 좋아요 버튼을 눌렀을 때 호출될 함수
  void _incrementLike() {
    setState(() {
      likeCount++;  // 좋아요 수를 1 증가
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Text(
            'U&I',
            style: TextStyle(
              fontFamily: 'perisienne',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '우리가 처음 만난 날',
            style: TextStyle(
              fontFamily: 'sunflower',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('2024.12.13'),
          SizedBox(height: 16),
          IconButton(
            onPressed: _incrementLike,  // 버튼 클릭 시 좋아요 수 증가
            icon: Icon(Icons.favorite, color: Colors.red),
          ),
          Text('좋아요 $likeCount'),  // 좋아요 수 표시
          SizedBox(height: 16),
          Text('D+100'),
        ],
      ),
    );
  }
}

class _Img extends StatelessWidget {
  const _Img({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'dog.jpg',
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}
