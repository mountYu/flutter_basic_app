import 'package:chat_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import './register.dart';
import '../chat/home.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // 値受け取り
    final infoText = watch(infoTextProvider).state;
    final email = watch(emailProvider).state;
    final password = watch(passwordProvider).state;

    return Scaffold(
        appBar: AppBar(
          title: Text('初期画面'),
        ),
        body: Center(
            child: Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'メールアドレス'),
                      onChanged: (String value) {
                        context.read(emailProvider).state =
                            'mountainroadyu@gmail.com';
                      },
                    ),
                    // パスワード入力
                    TextFormField(
                      decoration: InputDecoration(labelText: 'パスワード'),
                      obscureText: true,
                      onChanged: (String value) {
                        context.read(passwordProvider).state = 'Yu708235';
                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      // メッセージ表示
                      child: Text(infoText),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                        onPressed: () async {
                          try {
                            // メール/パスワードでログイン
                            final FirebaseAuth auth = FirebaseAuth.instance;
                            final result =
                                await auth.signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            // ログインに成功した場合
                            // チャット画面に遷移＋ログイン画面を破棄
                            await Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                                return ChatPage();
                              }),
                            );
                          } catch (e) {
                            // ログインに失敗した場合
                            context.read(infoTextProvider).state =
                                "ログインに失敗しました：${e.toString()}";
                          }
                        },
                        child: Text("ログイン")),
                    const SizedBox(height: 8),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              // 遷移先の画面としてリスト追加画面を指定
                              return RegisterPage();
                            }),
                          );
                        },
                        child: Text("新規登録の方はこちら")),
                  ],
                ))));
  }
}
