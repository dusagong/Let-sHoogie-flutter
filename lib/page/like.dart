import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import 'detail.dart';

class LikePage extends StatefulWidget {
  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  bool _isClicked = true;

  // const LikePage({Key? key}) : super(key: key);

  Widget _like() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser?.email)
          .collection("Like")
          .orderBy("timeStamp", descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return Padding(
          padding: const EdgeInsets.only(top: 0,left: 20,right: 20),
          child: Container(
                  height: 630   ,
                
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
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) => Container(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: InkWell(
                          onTap: () => Get.to(() => DetailPage(
                              pageInfo: "test",
                              titleStr: snapshot.data!.docs[index]['title'],
                              explainStr: snapshot.data!.docs[index]['explain'],
                              keyValue: snapshot.data!.docs[index]['key'],
                              date: snapshot.data!.docs[index]['dateTime'],
                              isClick: snapshot.data!.docs[index]['inside'],


                              )),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(snapshot.data!.docs[index]['title'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                        )),
                                    Text(snapshot.data!.docs[index]['dateTime'],
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 8,
                                        )),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(top: 12.0, bottom: 15),
                                    //   child: LikeButton(
                                    //     onTap: onLikeButtonTapped,
                                    //   ),
                                    // ),
                                    
                                  const Divider(color: Colors.black),
                                ],
                              ),
                              IconButton(
                                icon:Icon(Icons.content_cut),
                                onPressed: (){
                                  deleteData(snapshot.data!.docs[index].id);
                                  print('dd');
                                },
                              )
                            ],
                          )),
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
  Widget _likea() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser?.email)
          .collection("Likea")
          .orderBy("timeStamp", descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return Padding(
          padding: const EdgeInsets.only(top: 0,left: 20,right: 20),
          child: Container(
                  height: 630   ,
                
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
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) => Container(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: InkWell(
                          onTap: () => Get.to(() => DetailPage(
                              pageInfo: "test",
                              titleStr: snapshot.data!.docs[index]['title'],
                              explainStr: snapshot.data!.docs[index]['explain'],
                              keyValue: snapshot.data!.docs[index]['key'],
                              date: snapshot.data!.docs[index]['dateTime'],
                              isClick: snapshot.data!.docs[index]['inside'],


                              )),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(snapshot.data!.docs[index]['title'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                        )),
                                    Text(snapshot.data!.docs[index]['dateTime'],
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 8,
                                        )),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(top: 12.0, bottom: 15),
                                    //   child: LikeButton(
                                    //     onTap: onLikeButtonTapped,
                                    //   ),
                                    // ),
                                    
                                  const Divider(color: Colors.black),
                                ],
                              ),
                              IconButton(
                                icon:Icon(Icons.content_cut),
                                onPressed: (){
                                  deleteDataa(snapshot.data!.docs[index].id);
                                  print('dd');
                                },
                              )
                            ],
                          )),
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
Future deleteData(String id) async{
try {
  await  FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("Like")
      .doc(id)
      .delete();
  }catch (e){
    print('e');
    return false;
  }
}  
Future deleteDataa(String id) async{
try {
  await  FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("Likea")
      .doc(id)
      .delete();
  }catch (e){
    print('e');
    return false;
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
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
                  '  저장한 글',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          _isClicked?
          _like():_likea()
           
        ],
      ),
    ),
    floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _isClicked?
          Theme(
            data: Theme.of(context).copyWith(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                extendedSizeConstraints: BoxConstraints.tightFor(height : 30, width: 30),
              ),
            ),
            child:FloatingActionButton.extended(
              icon:Text(''),
              label: Text('out'),
              onPressed: (){
                setState(() {
                  _isClicked = false;
                });
              },
              backgroundColor: Color.fromARGB(255, 64, 64, 64),
            )
            
          ):
          Theme(
            data: Theme.of(context).copyWith(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                extendedSizeConstraints: BoxConstraints.tightFor(height : 50, width: 50),
              ),
            ),
            child:FloatingActionButton.extended(
              icon:Text(''),
              label: Text('out'),
              onPressed: (){
                
              },
              backgroundColor: Color.fromARGB(255, 226, 47, 47),

            )
            
          ),
    ////////////////////////
          _isClicked?
          Theme(
            data: Theme.of(context).copyWith(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                extendedSizeConstraints: BoxConstraints.tightFor(height : 50, width: 50),
              ),
            ),
            child:FloatingActionButton.extended(
              icon:Text(''),
              label: Text('in'),
              onPressed: (){
                
              },
              backgroundColor: Color.fromARGB(255, 226, 47, 47),

            )
            
          ):
          Theme(
            data: Theme.of(context).copyWith(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                extendedSizeConstraints: BoxConstraints.tightFor(height : 30, width: 30),
              ),
            ),
            child:FloatingActionButton.extended(
              icon:Text(''),
              label: Text('in'),
              onPressed: (){
                setState(() {
                  _isClicked = true;
                });
              },
              backgroundColor: Color.fromARGB(255, 64, 64, 64),

            )
            
          ),
          SizedBox(height: 40,)

        ],
      )
    );
  }
}

