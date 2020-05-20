import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expandable"),
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.green,
              child: Text("Expandable List", style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (c)=> HeaderPage(title: "Expandable List")
                ));
              },
            ),

            SizedBox(
              height: 20,
            ),

            RaisedButton(
              color: Colors.red,
              child: Text("Sticky Header List", style: TextStyle(color: Colors.white)),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (c)=> HeaderPage(title: "Sticky Header List")
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  final String title;

  HeaderPage({this.title});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: title == "Expandable List" ? ExpandableList() : StickyList(),
    );
  }
}

class ExpandableList extends StatelessWidget {
  var list = List.generate(10, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (c,i){
        return ExpansionTile(
          title: Text("Header ${i+1}"),
          children: list.map((val) => ListTile( title: Text(val),)).toList()
        );
      },
      itemCount: 5,
    );
  }
}

class StickyList extends StatelessWidget {
  var list = List.generate(10, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemBuilder: (c, i){
        return StickyHeader(
            header: Container(
              height: 50.0,
              color: Colors.blueGrey[700],
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text('Header #$i',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            content: Column(
                children:  list.map((val) => ListTile(
                  title: Text(val),
                )).toList()
            )
        );
      },
    );
  }
}



