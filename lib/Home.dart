import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var list = [];
  var output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Todo App'),
        ),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.amber,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: ListTile(
                  title: Text("${list[index]}"),
                  trailing: Container(
                    width: 70,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Update Item'),
                                      content: TextFormField(
                                        autofocus: true,
                                        initialValue: list[index],
                                        onChanged: (value) => output = value,
                                        decoration: InputDecoration(
                                            hintText: 'Update item'),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                list[index] = output;
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Update'))
                                      ],
                                    );
                                  });
                            },
                            child: Icon(Icons.edit)),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                list.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete)),
                      ],
                    ),
                  )),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Add Item'),
                  content: TextField(
                    onChanged: (value) => output = value,
                    decoration: InputDecoration(hintText: 'Add item'),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            list.add(output);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('Add'))
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
