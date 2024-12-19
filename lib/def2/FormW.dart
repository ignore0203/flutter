import 'package:flutter/material.dart';

class FormW extends StatefulWidget {
  const FormW({super.key});

  @override
  State<FormW> createState() => _FormWState();
}

class _FormWState extends State<FormW> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(

          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _TextArea(),  //TextField
                  _SliderArea(), //Slider
                  _RadioArea(), // Radiockat
                  // CheckBox


                ],

              )
            ],
          ),
        )

    );
  }
}


class _CheckBox extends StatefulWidget {
  const _CheckBox({super.key});

  @override
  State<_CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<_CheckBox> {


  List<String> _hobbys = ['코딩', '독서', '운동', '수영',  '제작'];
  Map<String, bool> _selectedHobbys = {}; // Map 기본 표시


  @override
  void initState() {
    print('init');
    super.initState();

    for(var h in _hobbys) {
      _selectedHobbys[h] = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: _hobbys.map(
              (hobby) {

            bool _isSelected = _selectedHobbys[hobby] ?? false;

            return Row(
              children: [
                Checkbox(value: _isSelected,
                    activeColor: Colors.tealAccent,
                    onChanged: (value) {
                      setState(() {
                        _selectedHobbys[hobby] = value ?? false;
                      });
                    }),
                Text(hobby,
                  style: TextStyle(
                      fontSize: 20,
                      color:  _isSelected ? Colors.red : Colors.black26,
                      fontWeight: _isSelected ? FontWeight.bold : FontWeight.normal
                  ),)
              ],
            );
          }
      ).toList(),
    );
  }
}




class _RadioArea extends StatefulWidget {
  const _RadioArea({super.key});

  @override
  State<_RadioArea> createState() => _RadioAreaState();
}

class _RadioAreaState extends State<_RadioArea> {

  List<String> cities = ['서울',  '대전', '부산', '인천']; // radio를 구성하는 목록
  String? _citieValue = null; // 사용자가 선택한 도시이름

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...cities.map(
                (city) {

              bool _isSelectedCity = (city == _citieValue);


              return Row(
                children: [
                  Radio<String> (
                    value: city,
                    groupValue: _citieValue,
                    activeColor: Colors.greenAccent, // Radio Button 클릭된 것, 색상 변경
                    onChanged: (value) {
                      setState(() {
                        _citieValue = value ?? '서울';
                      });
                    },
                  ),
                  Text(city,
                    style: TextStyle(
                        fontSize: 20,
                        color:  _isSelectedCity ? Colors.red : Colors.black26,
                        fontWeight: _isSelectedCity ? FontWeight.bold : FontWeight.normal
                    ),)

                ],
              );
            }
        )
      ],
    );
  }
}



class _SliderArea extends StatefulWidget {
  const _SliderArea({super.key});

  @override
  State<_SliderArea> createState() => _SliderAreaState();
}

class _SliderAreaState extends State<_SliderArea> {

  double _phoneNumber = 1000000000.0;

  @override
  Widget build(BuildContext context) {
    return Slider(value: _phoneNumber, onChanged: (value) {
      setState(() {
        _phoneNumber = value;

      });
    },
      min: 1000000000,// 최소값
      max: 1099999999,// 최대값
      divisions: 99999999,
      label: _phoneNumber.toStringAsFixed(0),
    );
  }
}


class _TextArea extends StatefulWidget {
  const _TextArea({super.key});

  @override
  State<_TextArea> createState() => _FormAreaState();
}

class _FormAreaState extends State<_TextArea> {

  String? _userName =  null;
  String? _userPassword = null;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(label: Text('이름 입력하기')), // Label
            keyboardType: TextInputType.text,  // 핸드폰 배포 시, 키보드 자판 style

            // 이벤트 헨들러 종류, 이벤트 핸들러 중 아무거나 하나는 필수로 챙길 것.
            onChanged: (value) {
              print('${value}');
              setState(() {
                _userName = value ?? '';
              });
            },
          ),


        ),
        Container(
          width: 200,
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(label: Text('비밀번호 입력하기')),
            obscureText: true,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              print('${value}');
              setState(() {
                _userPassword = value ?? '';
              });
            },
          ),
        ),
        ElevatedButton(onPressed: () {
          print('======================');
          print('_userName: ${_userName}');
          print('_userPassword: ${_userPassword}');
        }, child: Text('체크!'))
      ],
    );
  }
}