import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/main.dart';

class RegisterPage extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final infoText = watch(infoTextProvider).state;
    final email = watch(emailProvider).state;
    final password = watch(passwordProvider).state;

    return Scaffold(
      appBar: AppBar(
        title: Text('登録画面'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                // テキスト入力のラベルを設定
                decoration: InputDecoration(labelText: "メールアドレス"),
                onChanged: (String value) {
                  context.read(emailProvider).state = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: "パスワード（６文字以上）"),
                // パスワードが見えないようにする
                obscureText: true,
                onChanged:(String value) {
                  context.read(passwordProvider).state = value;
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // メール/パスワードでユーザー登録
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final UserCredential result =
                        await auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    // 登録したユーザー情報
                    final User user = result.user!;
                    context.read(infoTextProvider).state = "登録OK：${user.email}";

                  } catch (e) {
                    // 登録に失敗した場合
                   context.read(infoTextProvider).state = "登録NG：${e.toString()}";
                  }
                },
                child: Text("登録"),
              ),
              Text(infoText)
            ],
          ),
        ),
      ),
    );
  }
}