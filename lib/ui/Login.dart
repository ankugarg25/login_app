import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}
class LoginState extends State<Login>{

  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  String _welcomeString = "";
  void _erase(){
    setState((){
      _userController.clear();
      _passwordController.clear();
    });

  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white70,

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(               //column se scrolling me dikkat thi
          children: <Widget>[

            new Image.asset(
              'images/logo.png',
              width:280,
              height: 150,
            ),

            //form
            new Container(
              height: 180,width: 380,
              color: Colors.blueGrey,
              child: new Column(
                children: <Widget>[

                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: 'Username',
                      icon:new Icon(Icons.person)
                    ),
                  ),
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                        hintText: 'Password',
                        icon:new Icon(Icons.lock)
                    ),
                    obscureText :true,
                  ),
                  new Padding(padding: new EdgeInsets.all(10.5)),
                  new Center(
                  child : new Row(
                    children: <Widget>[
                      // login button
                      new Container(
                        margin : const EdgeInsets.only(left: 65),
                        child: new RaisedButton(
                            onPressed: ()=>_showWelcome(),
                            color : Colors.red,
                            child: new Text("Login",
                            style: new TextStyle(color: Colors.white,
                              fontSize: 16.9

                            ))
                        )
                      ),
                      // login button
                      new Container(
                          margin : const EdgeInsets.only(left: 109),
                          child: new RaisedButton(
                              onPressed: ()=>_erase(),
                              color : Colors.red,
                              child: new Text("Clear",
                                  style: new TextStyle(color: Colors.white,
                                      fontSize: 16.9

                                  ))
                          )
                      )
                    ]
                  ))
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(13.5)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("Welcome,$_welcomeString",
                  style: new TextStyle(color:Colors.black,
                  fontSize: 39,
                  fontWeight: FontWeight.w600))
                ],
            )
          ],
        ),
      ),
    );
  }

  void _showWelcome(){
    setState(() {
      if(_userController.text.isNotEmpty
          && _passwordController.text.isNotEmpty){
        _welcomeString = _userController.text;
      }
      else{
        _welcomeString ="nothing";
      }
    });
  }
}
