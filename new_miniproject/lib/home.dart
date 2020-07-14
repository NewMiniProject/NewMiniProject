import 'package:flutter/material.dart';
import 'package:new_miniproject/Hacking.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome Back, Uzumaki Gerhana"),
      ),
      body: Container(
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "images/deku.jpeg",
                width: 380.0,
                height: 360.0,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Whats Next?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ButtonTheme(
                  minWidth: 200.0,
                  height: 80.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.green, width: 10)),
                    color: Colors.white,
                    textColor: Colors.green,
                    padding: EdgeInsets.all(8.0),
                    onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyList(
                              // variable yang di pass ke page home
                            )));},
                    child: Text(
                      "Start Hacking".toUpperCase(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}