import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../widget/drawer.dart';
import 'detail.dart';

class recentPage extends StatefulWidget {
  @override
  _recentPageState createState() => _recentPageState();
}

class _recentPageState extends State<recentPage> {
  get onLikeButtonTapped => null;

  // const recentPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let'sHoogie"),
        // backgroundColor: Colors.red,
      ),
      endDrawer: myDrawer(),
      backgroundColor: Color.fromARGB(255, 240, 235, 235),
        body: Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Icon(
                  Icons.panorama_fish_eye,
                  size: 20,
                  color: Colors.red,
                ),
                Text(
                  '  교내',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        _home(),
      ]
    ),
        );
  }

   Widget _home() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, left: 8.0, right: 20.0, bottom: 20.0),
      child: StreamBuilder<QuerySnapshot>(
          // stream: FirebaseFirestore.instance.collectionGroup('Posts').orderBy('timeStamp', descending: true).snapshots(),
          stream: FirebaseFirestore.instance
              .collectionGroup('posts')
              .orderBy('timeStamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return Container(
               height: 600,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))
                                      
                ),
              child: Scrollbar(
                      child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: ((context, index) => Container(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: InkWell(
                          onTap: () => Get.to(() => DetailPage(
                                pageInfo: "moappgae",
                                titleStr: snapshot.data!.docs[index]['title'],
                                explainStr: snapshot.data!.docs[index]['explain'],
                                imgURL: snapshot.data!.docs[index]['firstPicUrl'],
                                keyValue: snapshot.data!.docs[index]['key'],
                                date: snapshot.data!.docs[index]['dateTime'],
                                isClick: snapshot.data!.docs[index]['inside'],

                              )),
                              
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.docs[index]['title'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text(snapshot.data!.docs[index]['authorName'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  )),
                              Divider(color: Color.fromARGB(255, 222, 222, 222)),
                            ],
                          ),
                        ))),
                  )),
            );
          }),
    );
  }
}
