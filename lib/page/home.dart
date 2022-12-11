import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'createPage.dart';
import 'detail.dart';
import 'recent.dart';
import 'recenta.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // CollectionReference<Map<String, dynamic>> _collectionReference = FirebaseFirestore.instance.collection("Posts");
  // QuerySnapshot<Map<String, dynamic>> querySanpshot = _collectionReference.orderBy("timeStamp").get();
  bool _isClicked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 251, 251),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
              width: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ElevatedButton(
                //   onPressed: null, 
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10.0)
                //   )
                // )
                ElevatedButton(
                  onPressed: () {},
                  child: RichText(
                    text: new TextSpan(
    // Note: Styles for TextSpans must be explicitly defined.
    // Child text spans will inherit styles from parent
    style: new TextStyle(
      fontSize: 14.0,
      color: Colors.black,
    ),
    children: <TextSpan>[
      new TextSpan(text: '#',style: TextStyle(color: Color.fromARGB(255, 226, 47, 47))),
      new TextSpan(text: ' 조회수', style: new TextStyle(fontWeight: FontWeight.bold)),
    ],
  ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // <-- Radius
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    side: const BorderSide(
                  width: 1.0,
                  color: Color.fromARGB(255, 226, 47, 47),
                  
                ),
                foregroundColor: Color.fromARGB(255, 38, 38, 38),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Button'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // <-- Radius
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    side: const BorderSide(
                  width: 1.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                  
                ),
                foregroundColor: Color.fromARGB(255, 38, 38, 38),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Button'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // <-- Radius
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    side: const BorderSide(
                  width: 1.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                  
                ),
                foregroundColor: Color.fromARGB(255, 38, 38,38),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Button'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // <-- Radius
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      side: const BorderSide(
                    width: 1.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                    
                  ),
                  foregroundColor: Color.fromARGB(255, 38, 38, 38),
                  ),
                ),         
              ],
            ),
            _isClicked?_home2():_home2a(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 17,
                ),
                TextButton(
                  onPressed: (){
                    _isClicked?
                    Get.to(() =>recentPage()):
                    Get.to(() =>recentaPage());
                  }, 
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 9, 9, 9),
                  ),
                  child: Text(
                    '최신 후기',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      ),
                  ),
                )  ,
                SizedBox(
                  width: 250,
                ),
                 IconButton(
                  onPressed: (){
                    _isClicked?
                    Get.to(() =>recentPage()):
                    Get.to(() =>recentaPage());
                  }, 
                  icon: Icon(Icons.arrow_forward_ios_rounded)
                  )      
              ],
            ),
            _isClicked?_home1():_home1a(),

            // _home(),
          ],
        ),
      ),
      
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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

  
  Widget _home1() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 0, left: 20.0, right: 20.0, bottom: 5.0),
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
            
            // Timestamp t = data['timeStamp'] as Timestamp;
            // DateTime date =   snapshot.data!.docs.toDate();
            return Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)),
                                      boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 0,
        blurRadius: 8,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
                                      
                ),
                child: Scrollbar(
                    child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: ((context, index) => Container(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0),
                      child: InkWell(
                        onTap: () { 
                          updating(snapshot.data!.docs[index].id);
                            
                            Get.to(() => DetailPage(
                          
                              pageInfo: "moappgae",
                              titleStr: snapshot.data!.docs[index]['title'],
                              explainStr: snapshot.data!.docs[index]['explain'],
                              imgURL: snapshot.data!.docs[index]['firstPicUrl'],
                              keyValue: snapshot.data!.docs[index]['key'],
                              date: snapshot.data!.docs[index]['dateTime'],
                              isClick: snapshot.data!.docs[index]['inside'],


                            ));
                            
                        },
                            
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.docs[index]['title'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(snapshot.data!.docs[index]['dateTime'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    )),
                                Divider(color: Color.fromARGB(255, 222, 222, 222)),
                              ],
                            ),
                            RichText(
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(text: snapshot.data!.docs[index]['num'].toString(),style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    )),
                                  new TextSpan(text: '회', style: new TextStyle(color: Colors.black,
                                      fontSize: 10,
                                    )),
                                ],
                              ),
                            ),
                            // Text(snapshot.data!.docs[index]['num'].toString(),
                            //         style: TextStyle(
                            //           color: Colors.black,
                            //           fontSize: 10,
                            //         )),
                          ],
                        ),
                      ))),
                )));
          }),
    );
  }
  Widget _home2() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0, bottom: 15.0),
      child: StreamBuilder<QuerySnapshot>(
          // stream: FirebaseFirestore.instance.collectionGroup('Posts').orderBy('timeStamp', descending: true).snapshots(),
          stream: FirebaseFirestore.instance
              .collectionGroup('posts')
              .orderBy('num', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            
            // Timestamp t = data['timeStamp'] as Timestamp;
            // DateTime date =   snapshot.data!.docs.toDate();
            return Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  borderRadius:
                      BorderRadius.all(Radius.circular(13)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                                      
                ),
                
                child: Scrollbar(
                    child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: ((context, index) => Container(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0),
                      child: InkWell(
                        onTap: () { 
                          updating(snapshot.data!.docs[index].id);
                            
                            Get.to(() => DetailPage(
                          
                              pageInfo: "moappgae",
                              titleStr: snapshot.data!.docs[index]['title'],
                              explainStr: snapshot.data!.docs[index]['explain'],
                              imgURL: snapshot.data!.docs[index]['firstPicUrl'],
                              keyValue: snapshot.data!.docs[index]['key'],
                              date: snapshot.data!.docs[index]['dateTime'],
                              isClick: snapshot.data!.docs[index]['inside'],

                            ));
                            
                        },
                            
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.docs[index]['title'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(snapshot.data!.docs[index]['dateTime'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    )),
                                Divider(color: Color.fromARGB(255, 222, 222, 222)),
                              ],
                            ),
                            RichText(
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(text: snapshot.data!.docs[index]['num'].toString(),style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    )),
                                  new TextSpan(text: '회', style: new TextStyle(color: Colors.black,
                                      fontSize: 10,
                                    )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))),
                )));
          }),
    );
  }
  Widget _home1a() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 0, left: 20.0, right: 20.0, bottom: 5.0),
      child: StreamBuilder<QuerySnapshot>(
          // stream: FirebaseFirestore.instance.collectionGroup('Posts').orderBy('timeStamp', descending: true).snapshots(),
          stream: FirebaseFirestore.instance
              .collectionGroup('postsa')
              .orderBy('timeStamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            
            // Timestamp t = data['timeStamp'] as Timestamp;
            // DateTime date =   snapshot.data!.docs.toDate();
            return Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)),
                                      boxShadow: [
                          BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                        ],
                                      
                ),
                child: Scrollbar(
                    child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: ((context, index) => Container(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0),
                      child: InkWell(
                        onTap: () { 
                          updatinga(snapshot.data!.docs[index].id);
                            
                            Get.to(() => DetailPage(
                          
                              pageInfo: "moappgae",
                              titleStr: snapshot.data!.docs[index]['title'],
                              explainStr: snapshot.data!.docs[index]['explain'],
                              imgURL: snapshot.data!.docs[index]['firstPicUrl'],
                              keyValue: snapshot.data!.docs[index]['key'],
                              date: snapshot.data!.docs[index]['dateTime'],
                              isClick: snapshot.data!.docs[index]['inside'],


                            ));
                            
                        },
                            
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.docs[index]['title'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(snapshot.data!.docs[index]['dateTime'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    )),
                                Divider(color: Color.fromARGB(255, 222, 222, 222)),
                              ],
                            ),
                            RichText(
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(text: snapshot.data!.docs[index]['num'].toString(),style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    )),
                                  new TextSpan(text: '회', style: new TextStyle(color: Colors.black,
                                      fontSize: 10,
                                    )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))),
                )));
          }),
    );
  }
  Widget _home2a() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0, bottom: 15.0),
      child: StreamBuilder<QuerySnapshot>(
          // stream: FirebaseFirestore.instance.collectionGroup('Posts').orderBy('timeStamp', descending: true).snapshots(),
          stream: FirebaseFirestore.instance
              .collectionGroup('postsa')
              .orderBy('num', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            
            // Timestamp t = data['timeStamp'] as Timestamp;
            // DateTime date =   snapshot.data!.docs.toDate();
            return Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)),
                                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                                      
                ),
                child: Scrollbar(
                    child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: ((context, index) => Container(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0),
                      child: InkWell(
                        onTap: () { 
                          updatinga(snapshot.data!.docs[index].id);
                            
                            Get.to(() => DetailPage(
                          
                              pageInfo: "moappgae",
                              titleStr: snapshot.data!.docs[index]['title'],
                              explainStr: snapshot.data!.docs[index]['explain'],
                              imgURL: snapshot.data!.docs[index]['firstPicUrl'],
                              keyValue: snapshot.data!.docs[index]['key'],
                              date: snapshot.data!.docs[index]['dateTime'],
                              isClick: snapshot.data!.docs[index]['inside'],

                            ));
                            
                        },
                            
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.docs[index]['title'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(snapshot.data!.docs[index]['dateTime'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    )),
                                Divider(color: Color.fromARGB(255, 222, 222, 222)),
                              ],
                            ),
                            RichText(
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(text: snapshot.data!.docs[index]['num'].toString(),style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    )),
                                  new TextSpan(text: '회', style: new TextStyle(color: Colors.black,
                                      fontSize: 10,
                                    )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))),
                )));
          }),
    );
  }
  Future<void> updating(String docId) async {
    // var col1;
    // int breaking = 0;
  
    // var query= await FirebaseFirestore.instance.collection("Posts").get();
    // for(var userdoc in query.docs){
      
    //   print('userdoc');
    //   QuerySnapshot feed = await FirebaseFirestore.instance.collection("Posts")
    //       .doc(userdoc.id).collection("posts").get();
    //   for (var postDoc in feed.docs ) {
    //   print('postDoc');

    //     if(postDoc.id == docId){
    //   print('postdocif');

    //       col1 = userdoc.id;
    //       breaking = 1;
    //       break;
    //     }
    //     // PostSrc post = PostSrc.fromDoc(postDoc);
    //     // allPosts.add(post);
    //   }
    //   if(breaking == 1)break;
    // }

    FirebaseFirestore.instance.collection('Posts').doc('디자인').collection('posts').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('미디어').collection('posts').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('사무/회계').collection('posts').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('관리').collection('posts').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('수업 TA').collection('posts').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('기타').collection('posts').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('외식/음료').collection('posts').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('유통/판매').collection('posts').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('운전/배달').collection('posts').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('교육/강사').collection('posts').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
   

  }
  Future<void> updatinga(String docId) async {
    // var col1;
    // int breaking = 0;
  
    // var query= await FirebaseFirestore.instance.collection("Posts").get();
    // for(var userdoc in query.docs){
      
    //   print('userdoc');
    //   QuerySnapshot feed = await FirebaseFirestore.instance.collection("Posts")
    //       .doc(userdoc.id).collection("posts").get();
    //   for (var postDoc in feed.docs ) {
    //   print('postDoc');

    //     if(postDoc.id == docId){
    //   print('postdocif');

    //       col1 = userdoc.id;
    //       breaking = 1;
    //       break;
    //     }
    //     // PostSrc post = PostSrc.fromDoc(postDoc);
    //     // allPosts.add(post);
    //   }
    //   if(breaking == 1)break;
    // }

    // FirebaseFirestore.instance.collection('Posts').doc('외식/음료').collection('postsa').doc(docId).update({
    //   'num' : FieldValue.increment(1),
    // });
    // FirebaseFirestore.instance.collection('Posts').doc('유통/판매').collection('postsa').doc(docId).update({
    //   'num' : FieldValue.increment(1),
    // });
    // FirebaseFirestore.instance.collection('Posts').doc('문화/여가/생활').collection('postsa').doc(docId).update({
    //   'num' : FieldValue.increment(1),
    // });
    // FirebaseFirestore.instance.collection('Posts').doc('서비스').collection('postsa').doc(docId).update({
    //   'num' : FieldValue.increment(1),
    // });
    // FirebaseFirestore.instance.collection('Posts').doc('사무/회계').collection('postsa').doc(docId).update({
    //   'num' : FieldValue.increment(1),
    // });
    // FirebaseFirestore.instance.collection('Posts').doc('고객상담/영업/리서치').collection('postsa').doc(docId).update({
    //   'num' : FieldValue.increment(1),
    // });
    // FirebaseFirestore.instance.collection('Posts').doc('생산/건설/노무').collection('postsa').doc(docId).update({
    //   'num' : FieldValue.increment(1),
    // });
    // FirebaseFirestore.instance.collection('Posts').doc('IT/인터넷').collection('postsa').doc(docId).update({
    //   'num' : FieldValue.increment(1),
    // });
    // FirebaseFirestore.instance.collection('Posts').doc('교육/강사').collection('postsa').doc(docId).update({
    //   'num' : FieldValue.increment(1),
    // });
    // FirebaseFirestore.instance.collection('Posts').doc('디자인/제작/미디어').collection('postsa').doc(docId).update({
    //   'num' : FieldValue.increment(1),
    // });
    // FirebaseFirestore.instance.collection('Posts').doc('운전/배달').collection('postsa').doc(docId).update({
    //   'num' : FieldValue.increment(1),
    // });
    // FirebaseFirestore.instance.collection('Posts').doc('병원/간호/연구').collection('postsa').doc(docId).update({
    //   'num' : FieldValue.increment(1),
    // });

 FirebaseFirestore.instance.collection('Posts').doc('디자인').collection('postsa').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('미디어').collection('postsa').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('사무/회계').collection('postsa').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('관리').collection('postsa').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('수업 TA').collection('postsa').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('기타').collection('postsa').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('외식/음료').collection('postsa').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('유통/판매').collection('postsa').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('운전/배달').collection('postsa').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
    FirebaseFirestore.instance.collection('Posts').doc('교육/강사').collection('postsa').doc(docId).update({
      'num' : FieldValue.increment(1),
    });
   
  }
}
