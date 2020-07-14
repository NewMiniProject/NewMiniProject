import 'package:flutter/material.dart';
import 'package:new_miniproject/Service.dart';
import 'package:new_miniproject/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Mini Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String nUsername, nPassword;
  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }
  //tambahkan form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.center,
            child: Text("Page Login",
                style: TextStyle(fontWeight: FontWeight.bold))),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.green),
                ),
                Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Input Email';
                        }
                        return null;
                      },
                      controller: myUsernameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Username',
                          hintText: "Input Email"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                    ),
                    //Password TextField
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Input Password';
                        }
                        return null;
                      },
                      maxLength: 16,
                      maxLengthEnforced: true,
                      controller: myPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _isHidePassword,
                      decoration: InputDecoration(
                          suffix: GestureDetector(onTap: () {
                            _togglePasswordVisibility();
                          },
                            child: Icon(
                              _isHidePassword ? Icons.visibility_off : Icons.visibility,
                              color: _isHidePassword ? Colors.grey : Colors.green,
                            ),
                          ),
                          isDense: true,
                          icon: Icon(Icons.lock),
                          labelText: 'Password',
                          hintText: "Input Password"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: RaisedButton(
                              color: Colors.green,
                              onPressed: () async {
                                nUsername = myUsernameController.text;
                                nPassword = myPasswordController.text;
                                var response = await Services()
                                    .loginUser(nUsername, nPassword);
                                if (response == 200) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home(
                                              // variable yang di pass ke page home
                                              )));
                                }
                              },
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
