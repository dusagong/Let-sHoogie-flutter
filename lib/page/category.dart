import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'board.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool _isClicked = true;
  bool _iswork = true;

  Widget _categoryButton(String text, String printStr, String imgpath, String pathname){
    return InkWell(
      onTap: (){
        print(printStr);
        Get.to(() => BoardScreen(pageInfo: text));
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20,
          bottom: 10,
        ),
        child: Column(
          children: [
            Image.asset(
              imgpath,
              width: 120,
              height: 120,
            ),
            Text(text),
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      _isClicked?
      (_iswork?Container(
        child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: <Widget>[
          _categoryButton("디자인", "교내근로 버튼이 눌렸습니다.", "asset/images/design.png", "Club"),
          _categoryButton("미디어", "TA 버튼이 눌렸습니다.", "asset/images/media.png", "Show"),
          _categoryButton("사무.회계", "양덕 버튼이 눌렸습니다.", "asset/images/samu.png", "Survey"),
          _categoryButton("관리", "법원 버튼이 눌렸습니다.", "asset/images/manage.png", "Lecture"),
          _categoryButton("수업/TA", "카페 버튼이 눌렸습니다.", "asset/images/TA.png", "Contest"),
          _categoryButton("기타", "기타 버튼이 눌렸습니다.", "asset/images/etc.png", "Etc"),
        ]
    ),
      ):
      Container(
        child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: <Widget>[
          _categoryButton("외식/음료", "교내근로 버튼이 눌렸습니다.", "asset/images/juice.png", "Club"),
          _categoryButton("유통/판매", "TA 버튼이 눌렸습니다.", "asset/images/sell.png", "Show"),
          _categoryButton("운전/배달", "양덕 버튼이 눌렸습니다.", "asset/images/drive.png", "Survey"),
          _categoryButton("교육/강사", "법원 버튼이 눌렸습니다.", "asset/images/study.png", "Lecture"),
          _categoryButton("디자인", "카페 버튼이 눌렸습니다.", "asset/images/design.png", "Contest"),
          _categoryButton("기타", "기타 버튼이 눌렸습니다.", "asset/images/etc.png", "Etc"),
        ]
    ),
      )):
      Container(
        child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: <Widget>[
          _categoryButton("외식/음료", "교내근로 버튼이 눌렸습니다.", "asset/images/juice.png", "Club"),
          _categoryButton("유통/판매", "TA 버튼이 눌렸습니다.", "asset/images/sell.png", "Show"),
          _categoryButton("문화/여가/생활", "양덕 버튼이 눌렸습니다.", "asset/images/media.png", "Survey"),
          _categoryButton("서비스", "법원 버튼이 눌렸습니다.", "asset/images/samu.png", "Lecture"),
          _categoryButton("사무/회계", "카페 버튼이 눌렸습니다.", "asset/images/TA.png", "Contest"),
          _categoryButton("고객상담/영업/리서치", "기타 버튼이 눌렸습니다.", "asset/images/study.png", "Etc"),
          _categoryButton("생산/건설/노무", "기타 버튼이 눌렸습니다.", "asset/images/manage.png", "Etc"),
          _categoryButton("IT/인터넷", "기타 버튼이 눌렸습니다.", "asset/images/etc.png", "Etc"),
          _categoryButton("교육/강사", "기타 버튼이 눌렸습니다.", "asset/images/design.png", "Etc"),
          _categoryButton("디자인/제작/미디어", "기타 버튼이 눌렸습니다.", "asset/images/sell.png", "Etc"),
          _categoryButton("운전/배달", "기타 버튼이 눌렸습니다.", "asset/images/juice.png", "Etc"),
          _categoryButton("병원/간호/연구", "기타 버튼이 눌렸습니다.", "asset/images/drive.png", "Etc"),
        ]
    ),
      ),
      
    floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _isClicked?
          _iswork?
          Theme(
            data: Theme.of(context).copyWith(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                extendedSizeConstraints: BoxConstraints.tightFor(height : 30, width: 50),
              ),
            ),
            child:FloatingActionButton.extended(
              icon:Text(''),
              label: Text('근로'),
              onPressed: (){
                setState(() {
                  _iswork = true;
                });
              },
              backgroundColor: Color.fromARGB(255, 138, 187, 40),
            )
            
          ):Theme(
            data: Theme.of(context).copyWith(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                extendedSizeConstraints: BoxConstraints.tightFor(height : 30, width: 50),
              ),
            ),
            child:FloatingActionButton.extended(
              icon:Text(''),
              label: Text('근로'),
              onPressed: (){
                setState(() {
                  _iswork = true;
                });
              },
              backgroundColor: Color.fromARGB(255, 64, 64, 64),
            )
            
          ):
          SizedBox(),
          _isClicked?
          _iswork?
          Theme(
            data: Theme.of(context).copyWith(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                extendedSizeConstraints: BoxConstraints.tightFor(height : 30, width: 50),
              ),
            ),
            child:FloatingActionButton.extended(
              icon:Text(''),
              label: Text('알바'),
              onPressed: (){
                setState(() {
                  _iswork = false;
                });
              },
              backgroundColor: Color.fromARGB(255, 64, 64, 64),
            )
            
          ):
          Theme(
            data: Theme.of(context).copyWith(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                extendedSizeConstraints: BoxConstraints.tightFor(height : 30, width: 50),
              ),
            ),
            child:FloatingActionButton.extended(
              icon:Text(''),
              label: Text('알바'),
              onPressed: (){
                setState(() {
                  _iswork = false;
                });
              },
              backgroundColor: Color.fromARGB(255, 33, 152, 61),
            )
            
          ):
          SizedBox(),
          /////////////////////////////
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
          (
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
            
          )):
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