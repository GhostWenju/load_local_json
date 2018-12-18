import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Load local JSON file"),
        ),
        body: new Container(
          child: new Center(
            //同过future builder和DefaultAssetBundle加载本地josn数据
            child: new FutureBuilder(
                future: DefaultAssetBundle
                    .of(context)
                    .loadString('data_repo/starwars_data.json'),
                builder: (context, snapshot) {
                  // Decode the json 手动管理数据解析
                  var newData = json.decode(snapshot.data.toString());

                  return new ListView.builder(
                    // Build the ListView
                    itemBuilder: (BuildContext context, int index) {
                      return new Card(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Text("Name: " + newData[index]['name']),
                            new Text("Height: " + newData[index]['height']),
                            new Text("Mass: " + newData[index]['mass']),
                            new Text(
                                "Hair Color: " + newData[index]['hair_color']),
                            new Text(
                                "Skin Color: " + newData[index]['skin_color']),
                            new Text(
                                "Eye Color: " + newData[index]['eye_color']),
                            new Text(
                                "Birth Year: " + newData[index]['birth_year']),
                            new Text("Gender: " + newData[index]['gender'])
                          ],
                        ),
                      );
                    },
                    itemCount: newData == null ? 0 : newData.length,
                  );
                }),
          ),
        ));
  }
}
