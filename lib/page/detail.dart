import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  String pageInfo;
  String titleStr;
  String explainStr;
  String keyValue;
  String date;
  int isClick;


  String imgURL;
  DetailPage(
      {Key? key,
      required this.pageInfo,
      required this.titleStr,
      required this.explainStr,
      required this.keyValue,
      required this.date,
      required this.isClick,

      this.imgURL = ''})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // bool _isClicked = false;

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  // Widget _likeWidget() {
  //   return StreamBuilder(
  //       stream: FirebaseFirestore.instance.collection('Users').doc());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.pageInfo),
        ),
        body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            widget.titleStr,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Divider(
                    //   color: Colors.black,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 10.0, right: 10.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(widget.explainStr,
                            style: const TextStyle(fontSize: 15, height: 1.7)),
                      ),
                    ),
                    Center(
                      child: (() {
                        if (widget.imgURL != '') {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Image.network(
                              alignment: Alignment.topCenter,
                              widget.imgURL,
                              width: 300,
                            ),
                          );
                        }
                      })(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 15),
                      child: IconButton(
                        icon:Icon(Icons.bookmark) ,
                        color: Color.fromARGB(255, 24, 23, 23),
                        onPressed: (){
                          widget.isClick == 1?
                          fireStore
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection("Like")
        .doc(widget.keyValue)
        .set({
          "title":widget.titleStr,
          "explain":widget.explainStr,
      "key": widget.keyValue,
      "dateTime": widget.date,
      "timeStamp":DateTime.now(),
      "inside" : widget.isClick,
    }):
    fireStore.collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection("Likea")
        .doc(widget.keyValue)
        .set({
          "title":widget.titleStr,
          "explain":widget.explainStr,
      "key": widget.keyValue,
      "dateTime": widget.date,
      "timeStamp":DateTime.now(),
      "inside" : widget.isClick,

    });

                          ScaffoldMessenger.of(context).showSnackBar( 
                            //SnackBar 구현하는법 context는 위에 BuildContext에 있는 객체를 그대로 가져오면 됨. 
                              SnackBar(
                                content: Text('Like a new Snack bar!'), //snack bar의 내용. icon, button같은것도 가능하다.
                                duration: Duration(seconds: 1), //올라와있는 시간
                                // action: SnackBarAction( //추가로 작업을 넣기. 버튼넣기라 생각하면 편하다.
                                //   label: 'Undo', //버튼이름
                                //   onPressed: (){}, //버튼 눌렀을때.
                                // ),
                              )
                          );
                        },
                      )
                    ),
                  ],
                ),
              
    );
  }
  
  
}
