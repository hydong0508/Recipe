// push -> push -> push -> pushAndRemoveUntil || pop
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: MoveMainPage(),
    )
  );
}

class MoveMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WrapperPage(
      title: "Main",
      moveNavigator: RaisedButton(
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => new Page2()
            )
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WrapperPage(
      title: "Page2",
      moveNavigator: RaisedButton(
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => new Page3()
            )
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Page3 extends StatelessWidget {
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        if(!_check){
          _check = !_check;
          return Future.value(false);
        }
        return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MoveMainPage()),
          (Route<dynamic> route) => false
        );
      },
      child: WrapperPage(
        title: "PAGE 3",
        moveNavigator: RaisedButton(
          child: Text("Back"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}


// ignore: must_be_immutable
class WrapperPage extends StatelessWidget {
  String title;
  Widget moveNavigator;
  WrapperPage({@required this.title, @required this.moveNavigator});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: this.moveNavigator,
      ),
    );
  }
}
