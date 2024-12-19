import 'package:flutter/material.dart';

class ka2 extends StatefulWidget {
  const ka2({Key? key}) : super(key: key);

  @override
  State<ka2> createState() => _ka2State();
}

class _ka2State extends State<ka2> {
  final _formKey = GlobalKey<FormState>();

  String? _userName = null;
  String? _userEmail = null;
  List<String> _hobbies = ['코딩', '독서', '운동', '수영', '제작'];
  Map<String, bool> _selectedHobbies = {};
  double _customService = 3;
  String? _ratingValue = '0';
  bool _isChecked = false;

  String? _citieValue = null;
  String? errorMsg = "";

  void submit() {
    if (_formKey.currentState!.validate()) {
      if (_citieValue == null || _citieValue!.isEmpty) {
        setState(() {
          errorMsg = '라디오 버튼을 체크해 주세요.';
        });
      } else {
        setState(() {
          errorMsg = '';
        });
      }
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('제출되었습니다.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Feedback', style: TextStyle(color: Colors.white)),
    centerTitle: true,
    ),
    body: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Form(
    key: _formKey,
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    // 이름
    TextFormField(
    decoration: InputDecoration(
    labelText: '이름',
    border: OutlineInputBorder(),
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return '이름을 입력해주세요.';
    }
    if (value.length < 5) {
    return '5글자 이상을 작성해주세요.';
    }
    return null;
    },
    onSaved: (value) {
    _userName = value;
    },
    ),
    SizedBox(height: 20),

    // 이메일
    TextFormField(
    decoration: InputDecoration(
    labelText: '이메일',
    border: OutlineInputBorder(),
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return '이메일을 입력해주세요.';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); //이메일 유효설 검사
    if (!emailRegex.hasMatch(value)) {
    return '올바른 이메일 형식을 작성해주세요.';
    }
    return null;
    },
    onSaved: (value) {
    _userEmail = value;
    },
    ),
    SizedBox(height: 20),

    // 평점 섹션
    Text(
    'How would you rate this app?',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    Container(
    alignment: Alignment.centerRight,
    child: Text(_ratingValue!, style: TextStyle(fontSize: 16),),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(5, (index) {
    return Row(
    children: [
    Radio<String>(
    value: '${index + 1}',
    groupValue: _ratingValue,
    onChanged: (value) {
    setState(() {
    _ratingValue = value;
    });
    },
    ),
    //Text('${index + 1}'),
    ],
    );
    }),
    ),

    SizedBox(height: 20),

    // 슬라이더
    Text(
    'How custom service?',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    Container(
    alignment: Alignment.centerRight,
    child: Text(_customService.toStringAsFixed(1), style: TextStyle(fontSize: 16),),
    ),
      Slider(
        value: _customService,
        min: 1,
        max: 10,
        divisions: 9,
        label: _customService.toString(),
        onChanged: (value) {
          setState(() {
            _customService = value;
          });
        },
      ),
      SizedBox(height: 20),

      // 제출 버튼
      Center(
        child: ElevatedButton(
          onPressed: _submitForm,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 400, vertical: 20),
          ),
          child: Text('Submit', style: TextStyle(fontSize: 16)),
        ),
      ),
    ],
    ),
    ),
    ),
    ),
        ),
    );
  }
}