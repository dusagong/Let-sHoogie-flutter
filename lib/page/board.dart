import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hanpae/screens/postcards.dart';

import 'createPage.dart';
import 'detail.dart';

class BoardScreen extends StatefulWidget {
  String pageInfo;
  BoardScreen({Key? key, required this.pageInfo}) : super(key: key);
  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  final FirebaseFirestore post = FirebaseFirestore.instance;
  // static final a = FirebaseAuth.instance.currentUser!.email;
  // final user = FirebaseFirestore.instance.collection('Users').doc(a).collection('Like') as Map<String, dynamic>;
  // final user = FirebaseFirestore.instance.collection('Users').doc(a).collection('Like') as Map<String, dynamic>;
  // final user = FirebaseFirestore.instance as Map<String, dynamic>;
  final Stream<QuerySnapshot<Map<String, dynamic>>> _likelist = FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser?.email)
      .collection("Like")
      .snapshots();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: Text(widget.pageInfo),
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot> (
            stream: FirebaseFirestore.instance.collection("Posts").doc(widget.pageInfo).collection('posts').orderBy('timeStamp', descending: true).snapshots(),
            builder:(context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: ((context, index) => Container(
                    padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: InkWell(
                      onTap: () {
                        _likelist.forEach(print);
                          
                        
                        Get.to((){
                            DetailPage(
                              pageInfo: widget.pageInfo,
                              titleStr: snapshot.data!.docs[index]['title'],
                              explainStr: snapshot.data!.docs[index]['explain'],
                              keyValue: snapshot.data!.docs[index]['key'],
                              date: snapshot.data!.docs[index]['dateTime'],
                              isClick: snapshot.data!.docs[index]['inside'],

                              imgURL: snapshot.data!.docs[index]['firstPicUrl'],
                            );
                          }
                        );
                      },
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
                            Text(
                              snapshot.data!.docs[index]['authorName'],
                            ),
                            Divider(color: Colors.black),
                          ],
                        ),
                      )
                    )
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(CreatePostPage()),
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 128, 211, 255),
      ),
    );
  }
}