import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MeguHomePage extends StatelessWidget {
  var book = "book";
  var meeting_title = 'アメリカ大都市の死と生';
  var tags = ' #建築#都市#ポストモダン';
  var date = '8/29';
  var member = '6';
  var place = '本郷キャンパス';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(children: [
          Text('MEG'),
          Text('The University of Tokyo', style: TextStyle(fontSize: 10))
        ]),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
                child: const Text(
                  '開催中',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {}),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                child: const Text(
                  '開催してほしい',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {}),
          ),
          SizedBox(
            width: 10,
          )
        ],
        elevation: 5,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Padding(
            padding: EdgeInsets.all(2),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Jane_Jacobs.jpg/560px-Jane_Jacobs.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("a"),
                        ),
                        Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              border: Border.all(color: Colors.orange)),
                          child: Column(children: [
                            Row(children: [
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(5),
                                    ),
                                  ),
                                  child: Text(book,
                                      style: TextStyle(color: Colors.white))),
                              Text(
                                tags,
                                style: TextStyle(fontSize: 10),
                              ),
                            ]),
                            Container(
                              height: 33,
                              child: Text(
                                meeting_title,
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                  border: const Border(
                                      top: const BorderSide(
                                color: Colors.black,
                                width: 0.5,
                              ))),
                              child: Row(
                                children: [
                                  Container(
                                      child: Text(date,
                                          style: TextStyle(fontSize: 10))),
                                  Container(
                                      child: Text("~" + member,
                                          style: TextStyle(fontSize: 10))),
                                  Container(
                                      child: Text(place,
                                          style: TextStyle(fontSize: 10))),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ))),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pop();
          }),
    );
  }
}
