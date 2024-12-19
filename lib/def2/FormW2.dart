import 'package:flutter/material.dart';

class FormW2 extends StatefulWidget {
  const FormW2({super.key});

  @override
  State<FormW2> createState() => _FormWState();
}

class _FormWState extends State<FormW2> {

  final _formKey = GlobalKey <FormState>(); // form 선언

  String? _userName =  null;
  String? _userPassword = null;
  List<String> cities = ['서울',  '대전', '부산', '인천']; // radio를 구성하는 목록
  String? _citieValue = null; // 사용자가 선택한 도시이름

  String? errorrMsg = '';

  /**
   *  submit 동작 하기
   */
  void submit() {

    setState(() {
      errorrMsg = '';
    });

    //우효성 감시
    if(_formKey.currentState!.validate()) //validate , event 실행
        {

      //radio 유효성 검사
      if(_citieValue!.isEmpty || _citieValue!.length != 2) {
        setState(() {
          errorrMsg = "radio를 체크 해주세요.";
        });
      }

      else {
        _formKey.currentState!.save();   //Submit => Save 진행
      }


      print('_userName: ${_userName}');
    } else {
      setState(() {

        errorrMsg = '실패!';
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(

            body: Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 200,
                            height: 50,
                            child: TextFormField(
                                decoration: InputDecoration(label: Text('이름 입력하기')), // Label
                                keyboardType: TextInputType.text,  // 핸드폰 배포 시, 키보드 자판 style

                                // 이벤트 헨들러 종류, 이벤트 핸들러 중 아무거나 하나는 필수로 챙길 것.   (onChanged) <= 얘를 이제 사용할 이유가 사라집니다.
                                validator: (value) {
                                  if(value!.isEmpty) {
                                    return "글자를 입력해 주세요.";
                                  }
                                  if(value!.length < 5) {
                                    return "5글자 이상을 작성해주세요.";
                                  }

                                  return null;
                                },
                                // form에 대해 submit을 누르게 되었을 때, 그때 데이터를 저장.
                                onSaved: (value) {
                                  _userName = value ?? '';
                                }
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
                        ],
                      ),

                      //TextField
                      _SliderArea(), //Slider
                      // _RadioArea(), // Radiockat

                      // Radio 기능
                      Row(
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
                      ),



                      _CheckBox(), // CheckBox

                      Text('${errorrMsg!.isEmpty ? '' : errorrMsg ?? ''}'),
                      //Submit 버튼
                      ElevatedButton(onPressed: submit, child: Text('submit'))

                    ],

                  )
                ],
              ),
            )
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