import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_miniproject/ModelHacker/ModelHacker.dart';
import 'package:new_miniproject/Service.dart';
import 'package:new_miniproject/camera_screen.dart';
import 'package:new_miniproject/generate.dart';
import 'package:new_miniproject/scan.dart';

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  HackerList _hackerList = new HackerList();

//  Future getData() async {
//    //HackerModel hackerModel;
//    Dio dio = new Dio();
//    Response response = await dio.get('https://reqres.in/api/users?page=2');
//    return HackerModel.populate(response.data);
//  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async{
    HackerList hackerList = await Services().getListUser();
    //_hackerList = await Services().getListUser();
    setState(() {
      _hackerList = hackerList;
    });
  }

//  final hackers = [
//    HackersModel(
//      nama: 'Idr Corner',
//      alamat: 'tatank@coyvo.com',
//      id: '01jey',
//    ),
//    //avatar: '1.png'),
//    HackersModel(
//      nama: 'Khalid Al Faruq',
//      alamat: 'lamur@gwfwr.co.id',
//      id: '08123123GGG',
//    ),
//    //avatar: '2.jpg'),
//    HackersModel(
//      nama: 'Dora Explorer',
//      alamat: 'Jmdji.@33rsv.com',
//      id: '01234567PAPAP',
//    ),
//    //avatar: '3.png'),
//    HackersModel(
//      nama: 'Putri Salju',
//      alamat: 'Jamal.rat@mail.com',
//      id: '4434Skurap',
//    ),
//    //avatar: '4.png'),
//    HackersModel(
//      nama: 'Massa and The Bear',
//      alamat: 'JMekarsari.wgwg.com',
//      id: '123HaysimKIPU',
//    ),
//    //avatar: '5.png'),
//    HackersModel(
//      nama: '3 Litle Ducks',
//      alamat: 'Jebehmail@mail.com5',
//      id: '767halah',
//    ),
//    //avatar: '6.jpg'),
//  ];
  //HackerList hackerList = new HackerList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome Back, Uzumaki Gerhana"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 30,
            width: 50,
            child: Text(
              "Cool Hacker ListView",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.green), textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 280.0,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _hackerList.hackerList == null ? 0 : _hackerList.hackerList.length ,
              itemBuilder: (context, index) {
                  return Slidable(
                      key: ValueKey(index),
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: "Update",
                          color: Colors.grey.shade300,
                          icon: Icons.edit,
                          closeOnTap: false,
                          onTap: () {},
                        ),
                        IconSlideAction(
                          caption: "Delete",
                          color: Colors.red.shade300,
                          icon: Icons.edit,
                          closeOnTap: true,
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: "Delete Successfull",
                                toastLength: Toast.LENGTH_SHORT,
                                backgroundColor: Colors.red,
                                textColor: Colors.white);
                          },
                        ),
                      ],
                      dismissal: SlidableDismissal(
                        child: SlidableDrawerDismissal(),
                      ),
                      child: CardList(_hackerList.hackerList[index]));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GeneratePage()));
                            },
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.green, width: 6)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 20.0),
                            child: Text(
                              "QA Builder",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScanPage()));},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.green, width: 6)),
                            color: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 20.0),
                            child: Text(
                              "QA Scanner",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: RaisedButton(
                      onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CameraScreen()));},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.green, width: 6)),
                      color: Colors.yellow,
                      padding: EdgeInsets.symmetric(
                          horizontal: 80.0, vertical: 20.0),
                      child: Text(
                        "Camera",
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),


    );
  }
}




class CardList extends StatelessWidget {
  final HackerModel _hackerModel;

  CardList(this._hackerModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 8,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Card(
        //padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          elevation: 10.0,
          child: InkWell(
              onTap: () {
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Hero(
                            tag: _hackerModel.avatar,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(_hackerModel.avatar),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.person, color: Colors.green,),
                                    Text("${_hackerModel.firstName} ${_hackerModel.lastName}",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.email,color: Colors.blueAccent,),
                                    Text(_hackerModel.email,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0,
                                            color: Colors.grey)),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("ID : ",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0,
                                            color: Colors.red)),
                                    Text(_hackerModel.id.toString(),
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0,
                                            color: Colors.grey)),
                                  ],
                                )
                              ]),
                        )
                      ])),
                ],
              ))),
    );
  }
}
