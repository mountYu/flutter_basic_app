import 'package:flutter/material.dart';

class SideNavigation extends StatelessWidget {
  @override
  int _selectedIndex = 0;
  Widget build(BuildContext context){
    return 
      NavigationRail(
      selectedIndex: _selectedIndex,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.thumbs_up_down),
          label: Text('ThumbsUpDown'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.people),
          label: Text('People'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.face),
          label: Text('Face'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.bookmark),
          label: Text('Bookmark'),
        ),
      ],
    );
  }
}


class _PostHeader extends StatelessWidget{
  Widget build(BuildContext context){
    return Row(
      children: [
        Expanded(
          flex:1,
          child: ListTile(
            leading: ClipOval(
              child:Container(
                color: Colors.grey[300],
                width: 48,
                height: 48,
                child: Icon(
                  Icons.storage,
                  color: Colors.grey[800],
                ),
              )
            ),
            title: const Text('Posts'),
            subtitle: const Text('20 Posts'),
          )
        ),
        Expanded(
          flex:1,
          child: ListTile(
            leading: ClipOval(
              child:Container(
                color: Colors.grey[300],
                width: 48,
                height: 48,
                child: Icon(
                  Icons.style,
                  color: Colors.grey[800],
                ),
              )
            ),
            title: const Text('AllTypes'),
            subtitle: const Text(''),
          )
        ),
      ],
    );
  }
}


class _Post extends StatelessWidget {
  final String name;
  final String message;
  final String textReason;
  final Color colorPrimary;
  final Color colorPositive;
  final String textPositive;
  final Color colorNegative;
  final String textNegative;

  const _Post({
    Key? key,
    required this.name,
    required this.message,
    required this.textReason,
    required this.colorPrimary,
    required this.colorPositive,
    required this.textPositive,
    required this.colorNegative,
    required this.textNegative,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child:Card(
        child:Column(children: [
          ListTile(
          leading: ClipOval(
            child: Container(
              color: colorPrimary,
              width: 48,
              height: 48,
              child: Center(
                child: Text(
                  name.substring(0, 1),
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
          title: Text(name),
          subtitle: const Text('2 min ago'),
        ),
        Container(
          padding:EdgeInsets.symmetric(horizontal: 8),
          child:Row(
            children:[
            const SizedBox(width:72),
            Container(
              width: 16,
              height:16,
              decoration: BoxDecoration(
                border: Border.all(color: colorPrimary, width: 4),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width:8),
            Flexible(child: Text(message))
            ],
          )
        ),
        Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: colorPrimary, width: 2),
                      ),
                    ),
                    child: Text(
                      textReason,
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: colorNegative,
                      ),
                      onPressed: () {},
                      child: Text(textNegative),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: colorPositive,
                        backgroundColor: colorPositive.withOpacity(0.2),
                      ),
                      onPressed: () {},
                      child: Text(textPositive),
                    ),
                  ),
                ],
              ),
        ),
        ],
      )
    ),);
  }
}

class _PostGreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Post(
      name: 'Pean',
      message: 'Weak reason. No action required.',
      textReason: 'Report Details',
      colorPrimary: Colors.greenAccent,
      colorPositive: Colors.greenAccent,
      textPositive: 'Keep',
      colorNegative: Colors.blueAccent,
      textNegative: 'Archive',
    );
  }
}

class _PostRed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Post(
      name: 'Namaga Tema',
      message: 'Not recomended for publication.',
      textReason: 'Pending Reason',
      colorPrimary: Colors.deepOrangeAccent,
      colorPositive: Colors.blueAccent,
      textPositive: 'Publish',
      colorNegative: Colors.deepOrangeAccent,
      textNegative: 'Decline',
    );
  }
}



class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      padding:EdgeInsets.all(10),
      child:Column(
      children:[
        const SizedBox(height: 50),
        _PostHeader(),
        Expanded(
            child: ListView(
              children: [
                _PostGreen(),
                _PostRed(),
                _PostGreen(),
                _PostRed(),
                _PostGreen(),
                _PostRed(),
              ],
            ),
          ),

    ]
    )
    
    );
    }
}



class AdminMbilePage extends StatelessWidget {
  // 入力した投稿メッセージ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children:[
          SideNavigation(),
          Expanded(
            child: PostList(),
          ),
        ]
    ),
    floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).pop();
        }),
        );
  }
}