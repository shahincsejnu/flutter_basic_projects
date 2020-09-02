import 'dart:convert';
import 'package:flutter/material.dart';


void main()  => runApp(MaterialApp(
  home: HomePage(),
));

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  List data;
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Local Json Data App"),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: DefaultAssetBundle
            .of(context)
            .loadString('load_json/stock_market_data.json'),
          builder: (context, snapshot){
            var showdata = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Date " + showdata[index]['date']),
                      Text("Trade Code " + showdata[index]['trade_code']),
                      Text("High " + showdata[index]['high']),
                      Text("Low " + showdata[index]['low']),
                      Text("Open " + showdata[index]['open']),
                      Text("Close " + showdata[index]['close']),
                      Text("Volume " + showdata[index]['volume']),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}