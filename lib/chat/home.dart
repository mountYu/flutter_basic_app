import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './addchat.dart';
import '../uidesign/ui_design_home.dart';
import 'package:chat_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../zenn tutorial/zenn1.dart';
//RiverPod
//最初のWidgetを ProviderScope() の子Widgetとし、データの受け渡しが可能な状態にする
//StateProvider を使い受け渡すデータを定義する
//ConsumerWidget を使いデータを受け取る

//親Widget
class ChatPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final User user = watch(userProvider).state!;
    return Scaffold(
      appBar: AppBar(
          title: const Text('chatapp'),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    // 引数からユーザー情報を渡す
                    return UiDesignHomePage();
                  }),
                );
              },
            ),
          ]),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: Text('ログイン情報：${user.email}'),
          ),
          ElevatedButton(
              child: Text('MeguHome'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    // 遷移先の画面としてリスト追加画面を指定
                    return MeguHomePage();
                  }),
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 引数からユーザー情報を渡す
              return AddPostPage();
            }),
          );
        },
      ),
    );
  }
}
