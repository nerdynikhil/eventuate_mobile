import 'package:eventuate_mobile/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:eventuate_mobile/signup.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TextEditingController userController, passwordController;
  bool isLoading = false;
  GlobalKey<ScaffoldState> myKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    userController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    passwordController.dispose();
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: myKey,
        backgroundColor: Colors.grey[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(),
              flex: 2,
            ),
            Container(
              child: Image.asset(
                'assets/images/logo.png',
                height: 170,
                width: 170,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30.0),
              padding: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: userController,
                decoration: InputDecoration(
                    hintText: 'Phone number or Email',
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.face,
                      color: Color.fromARGB(255, 90, 117, 130),
                    )),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                    )
                  ]),
            ),

            Container(
              margin:
              EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0, bottom: 5),
              padding: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.vpn_key,
                      color: Color.fromARGB(255, 90, 117, 130),
                    )),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                    )
                  ]),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: login,
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                          colors: [Colors.blueGrey, Color.fromARGB(255, 90, 117, 130)])),
                  child: FlatButton(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ))),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 0),
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 90, 117, 130)),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.black12),
                  child: FlatButton(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ))),
            ),
            Expanded(
              child: Container(),
              flex: 1,
            ),
          ],
        ),
    );
  }


  login() {
    setState(() {
      isLoading = true;
    });
    var email = userController.text.trim();
    var password = passwordController.text.trim();
    if (email == '' || password == '') {
      isLoading = false;
      // ignore: deprecated_member_use
      return myKey.currentState.showSnackBar(SnackBar(
        content: Text('Check the fields before login'),
      ));
    }
    String url = "https://nerdynikhil.tech/test/login.php";
    Future<http.Response> response;
    // response = http.get(url + "?user=$email&pass=$password");
    response.then((response) async {
      setState(() {
        isLoading = false;
      });
      var data = json.decode(response.body);
      bool value = data['result'];
      if (value == true) {
        String id = data['id'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("login", id);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        String reason = data['reason'];
        myKey.currentState.showSnackBar(SnackBar(
          content: Text(reason),
        ));
      }
    });
  }

}


