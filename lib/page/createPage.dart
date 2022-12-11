import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widget/drawer.dart';


class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  late bool titleUpload;
  late bool contentUpload;

  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  bool isMetrica = true;
  bool isImperiala = false;
  late List<bool> isSelected;
  late List<bool> isSelecteda;

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  TextEditingController titleController = TextEditingController();
  TextEditingController storyController = TextEditingController();

  String postTitle = "";
  String story = "";

  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random(); 

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  // final _valueList = ['카테고리', '외식/음료', '유통/판매', '문화/여가/생활', '서비스', '사무/회계', '고객상담/영업/리서치', '생산/건설/노무', 'IT/인터넷', '교육/강사', '디자인/제작/미디어', '운전/배달', '병원/간호/연구'];
  final _valueLista = ['카테고리', '디자인', '미디어', '사무/회계', '관리', '수업 TA', '기타']; 
  final _valueList = ['카테고리', '디자인', '미디어', '사무/회계', '관리', '수업 TA', '기타']; 
  final _valueListb = ['카테고리', '외식/음료', '유통/판매', '운전/배달', '교육/강사', '디자인', '기타'];
  var _selectedValue = '카테고리';

  @override
  void initState() {
    titleUpload = false;
    contentUpload = false;
    isSelected = [isMetric, isImperial];
    isSelecteda = [isMetrica, isImperiala];
    super.initState();
  }

  void showDatePickerPop() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(), //초기값
      firstDate: DateTime(2022), //시작일
      lastDate: DateTime(2024), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(), //다크 테마
          child: child!,
        );
      },
    );

    selectedDate.then((dateTime) {
      Fluttertoast.showToast(
        msg: dateTime.toString(),
        toastLength: Toast.LENGTH_LONG,
        //gravity: ToastGravity.CENTER,  //위치(default 는 아래)
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let'sHoogie"),
      ),
      backgroundColor: Color.fromARGB(255, 252, 251, 251),
      endDrawer: myDrawer(),

      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Text('교내/교외 선택'),
                SizedBox(width: 50,),
                ToggleButtons(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('교내', style: TextStyle(fontSize: 18))),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('교외', style: TextStyle(fontSize: 18))),
                ],
                isSelected: isSelected,
                onPressed: toggleSelect,
          ),
              ],
            ),
          isMetric?
          Row(
            children: [
                Text('근로/알바 선택'),
                SizedBox(width: 50,),

              ToggleButtons(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('근로', style: TextStyle(fontSize: 18))),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('알바', style: TextStyle(fontSize: 18))),
                ],
                isSelected: isSelecteda,
                onPressed: toggleSelecta,
              ),
            ],
          ):SizedBox(),
            isMetric?
            isMetrica?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: DropdownButton(
                    value: _selectedValue,
                    items: _valueLista.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedValue = value as String;
                      });
                    },
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 23),
                  child: IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () {
                    showDatePickerPop();
                  },

                ),
                )

              ],
            ):
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: DropdownButton(
                    value: _selectedValue,
                    items: _valueListb.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedValue = value as String;
                      });
                    },
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 23),
                  child: IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () {
                    showDatePickerPop();
                  },

                ),
                )

              ],
            ):
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: DropdownButton(
                    value: _selectedValue,
                    items: _valueList.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedValue = value as String;
                      });
                    },
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 23),
                  child: IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () {
                    showDatePickerPop();
                  },

                ),
                )

              ],
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.title),
                border: OutlineInputBorder(),
                labelText: '제목',
                // hintText: '제목',
              ),
              onChanged: (value) {
                setState(() {
                  postTitle = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(
                controller: storyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.content_paste_go),
                  labelText: '내용을 입력하세요',
                  // hintText: '내용을 입력하세요',
                ),
                maxLines: 20,
                onChanged: (value) {
                  setState(() {
                    story = value;
                  });
                },
              ),
            ),
            
            ElevatedButton(
                onPressed: _selectedValue == '카테고리' ||
                        story == "" ||
                        postTitle == ""
                    ? null
                    : () {
                        String postKey = getRandomString(16);
                        isMetric?fireStore
                            .collection('Posts')
                            .doc(_selectedValue)
                            .collection('posts')
                            .doc(postKey)
                            .set({
                          "key": postKey,
                          "title": postTitle,
                          "explain": story,
                          "firstPicUrl": "",
                          "firstPicWidth": 0,
                          "firstPicHeight": 0,
                          "authorName":
                              FirebaseAuth.instance.currentUser!.email,
                          "like": "0",
                          'timeStamp': DateTime.now(),
                          'dateTime' : DateFormat.yMd().add_jm().format(DateTime.now()),
                          'num' : 0,
                          'inside' : 1,
                        }):fireStore
                            .collection('Posts')
                            .doc(_selectedValue)
                            .collection('postsa')
                            .doc(postKey)
                            .set({
                          "key": postKey,
                          "title": postTitle,
                          "explain": story,
                          "firstPicUrl": "",
                          "firstPicWidth": 0,
                          "firstPicHeight": 0,
                          "authorName":
                              FirebaseAuth.instance.currentUser!.email,
                          "like": "0",
                          'timeStamp': DateTime.now(),
                          'dateTime' : DateFormat.yMd().add_jm().format(DateTime.now()),
                          'num' : 0,
                          'inside' : 0,
                        });
                        
                        // isMetric?
                        // (isMetrica?
                        // fireStore
                        //     .collection('Posts')
                        //     .doc(_selectedValue)
                        //     .collection('postsaaa')
                        //     .doc(postKey)
                        //     .set({
                        //   "key": postKey,
                        //   "title": postTitle,
                        //   "explain": story,
                        //   "firstPicUrl": "",
                        //   "firstPicWidth": 0,
                        //   "firstPicHeight": 0,
                        //   "authorName":
                        //       FirebaseAuth.instance.currentUser!.email,
                        //   "like": "0",
                        //   'timeStamp': DateTime.now(),
                        //   'dateTime' : DateFormat.yMd().add_jm().format(DateTime.now()),
                        //   'num' : 0,
                        //   'inside' : 1,
                        // }):
                        // fireStore
                        //     .collection('Posts')
                        //     .doc(_selectedValue)
                        //     .collection('postsbbb')
                        //     .doc(postKey)
                        //     .set({
                        //   "key": postKey,
                        //   "title": postTitle,
                        //   "explain": story,
                        //   "firstPicUrl": "",
                        //   "firstPicWidth": 0,
                        //   "firstPicHeight": 0,
                        //   "authorName":
                        //       FirebaseAuth.instance.currentUser!.email,
                        //   "like": "0",
                        //   'timeStamp': DateTime.now(),
                        //   'dateTime' : DateFormat.yMd().add_jm().format(DateTime.now()),
                        //   'num' : 0,
                        //   'inside' : 0,

                        // })):
                        // null
                        // ;
                        
                        Get.back();


                        // FirebaseFirestore
                        // fireStore = FirebaseFirestore.instance;
                      },
                style: ElevatedButton.styleFrom(
                    onSurface: Color.fromARGB(255, 63, 141, 180)),
                child: Text("upload")),
          ]),
        ),
      ),
    );
  }
  void toggleSelect(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }
  void toggleSelecta(value) {
    if (value == 0) {
      isMetrica = true;
      isImperiala = false;
    } else {
      isMetrica = false;
      isImperiala = true;
    }
    setState(() {
      isSelecteda = [isMetrica, isImperiala];
    });
  }
}
