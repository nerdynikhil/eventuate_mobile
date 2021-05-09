import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'You can login with your account now.',
              style: TextStyle(color: Colors.blue),
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  TextEditingController username, email, password, phno, conpassword;
  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    phno = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    conpassword = TextEditingController();
  }

  void dispose() {
    super.dispose();
    username.dispose();
    phno.dispose();
    email.dispose();
    password.dispose();
    conpassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
            padding: EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: username,
              decoration: InputDecoration(
                  hintText: 'Full name',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.face,
                    color: Colors.grey,
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
            margin: EdgeInsets.only(top: 10, left: 30.0, right: 30.0),
            padding: EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                  hintText: 'Email',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.email,
                    color: Colors.grey,
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
            margin: EdgeInsets.only(top: 10, left: 30.0, right: 30.0),
            padding: EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: phno,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Phone number',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.phone,
                    color: Colors.grey,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  }),
              Text(
                'Male',
                style: new TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              Radio(
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  }),
              Text(
                'Female',
                style: new TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0, left: 30.0, right: 30.0),
            padding: EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.vpn_key,
                    color: Colors.grey,
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
            EdgeInsets.only(top: 10, left: 30.0, right: 30.0, bottom: 15.0),
            padding: EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: conpassword,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Confirm password',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.vpn_key,
                    color: Colors.grey,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: groupValue1,
                  onChanged: (value) {
                    setState(() {
                      groupValue1 = value;
                    });
                  }),
              Text(
                'Investor',
                style: new TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              Radio(
                  value: 2,
                  groupValue: groupValue1,
                  onChanged: (value) {
                    setState(() {
                      groupValue1 = value;
                    });
                  }),
              Text(
                'Tycoon',
                style: new TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.white,
                ),
                child: Checkbox(
                  value: checked,
                  activeColor: Colors.white,
                  checkColor: Color.fromARGB(255, 90, 117, 130),
                  onChanged: (value) {
                    setState(() {
                      checked = value;
                    });
                  },
                ),
              ),
              Text(
                'I agree to the Terms of Use and Privacy Policy.',
                softWrap: true,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          GestureDetector(
            onTap: checked ? signup : showSnack,
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 30),
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        colors: [Colors.blueGrey, Color.fromARGB(255, 90, 117, 130)])),
                child: FlatButton(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ))),
          )
        ],
      ),
    );
  }

  void signup() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Dashboard()));
    // String name = username.text.toString().trim();
    // String mob = phno.text.toString().trim();
    // String mail = email.text.toString().trim();
    // String pass = password.text.toString().trim();
    // String conpass = conpassword.text.toString().trim();
    // if (name.isEmpty)
    //   key.currentState.showSnackBar(SnackBar(
    //     content: Text("Username can't be empty"),
    //   ));
    // else if (mob.isEmpty)
    //   key.currentState.showSnackBar(SnackBar(
    //     content: Text("Phone number can't be empty"),
    //   ));
    // else if (mail.isEmpty)
    //   key.currentState.showSnackBar(SnackBar(
    //     content: Text("Email can't be empty"),
    //   ));
    // else if (pass.isEmpty)
    //   key.currentState.showSnackBar(SnackBar(
    //     content: Text("Password can't be empty"),
    //   ));
    // else if (conpass.isEmpty)
    //   key.currentState.showSnackBar(SnackBar(
    //     content: Text("Confirm your password"),
    //   ));
    // else if (groupValue != 1 && groupValue != 2)
    //   key.currentState.showSnackBar(SnackBar(
    //     content: Text("Provide your gender"),
    //   ));
    // else {
    //   String url = "https://nerdynikhil.tech/test/signup.php?";
      // var response = http.get(url +
      //     "name=$name&password=$conpass&email=$mail&phone=$mob&gender=$groupValue");
      // print(url +
      //     "name=$name&password=$conpass&email=$mail&phone=$mob&gender=$groupValue");
      // response.then((response) {
      //   var data = json.decode(response.body);
      //   var value = data['result'];
      //   if (value) {
      //     Navigator.pop(this.context);
      //     key.currentState.showSnackBar(SnackBar(
      //       content: Text('You can sign in with your account now.'),
      //     ));
      //     createAlertDialog(context);
      //   } else {
      //     String reason = data['reason'];
      //     key.currentState.showSnackBar(SnackBar(
      //       content: Text(reason),
      //     ));
      //   }
      // });
    //}
  }

  showSnack() {
    key.currentState.showSnackBar(SnackBar(
      content: Text("You must agree to our terms to continue."),
    ));
  }

  bool checked = false;
  int groupValue = 1;
  int groupValue1 = 1;
  bool value = true;
}
