import 'package:flutter/material.dart';

class Ingridient extends StatefulWidget {
  @override
  _IngridientState createState() => _IngridientState();
}

class _IngridientState extends State<Ingridient> {
  final List<String> item = <String>['apple', 'banana', 'chicken', 'egg', 'pineapple'];

  TextEditingController nameController = TextEditingController();

  void addItemToList(){
    setState(() {
      String newItem = nameController.text.toLowerCase();
      if(item.indexOf(newItem) == -1) item.insert(0,newItem);
      item.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: Text('My Ingridients'),
        ),
        body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'new item',
                  ),
                ),
              ),
              RaisedButton(
                child: Text('Add'),
                onPressed: () {
                  addItemToList();
                },
              ),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                      itemCount: item.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          color: index % 2 == 1? Colors.blue[500]:
                           Colors.blue[200],
                          child: Center(
                              child: Text('${item[index]}',
                                style: TextStyle(fontSize: 18),
                              )
                          ),
                        );
                      }
                  )
              )
            ]
        )
    );
  }
}