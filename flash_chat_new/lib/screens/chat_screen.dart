import 'package:flutter/material.dart';
import 'package:flash_chat_new/constants.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore
      .instance; // latest versionではFirestore -> FirebaseFirestoreに変更になってる
  User loggedInUser; // latest versionではFirebaseUser -> Userに変更になってる
  String messageText;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() {
    // userがsigninしているかどうかを確認する
    try {
      final user = _auth.currentUser; // latest versionではメソッドじゃなくてプロパティになった
      // final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    // Udemyと書き方が変わっているので注意
    final messages = await _firestore
        .collection('messages')
        .get(); // messagesにはFuture<Querysnapshot>が入る
    for (var message in messages.docs) {
      // messages.docsにはDocumentSnapshotのListが格納されている
      print(message.data()); // message.data()で各データにアクセスできる
    }
  }

  void messagesStream() async {
    // Futureオブジェクトのリスト(Stream)が格納する
    Stream<QuerySnapshot> snapshots =
        _firestore.collection('messages').snapshots();
    await for (var snapshot in snapshots) {
      print(snapshot);
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                // _auth.signOut();
                // Navigator.pop(context);
                // getMessages();
                messagesStream();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      //Implement send functionality.
                      //messageText + loggedInUser.email
                      _firestore.collection('messages').add(
                        {
                          'text': messageText,
                          'sender': loggedInUser.email,
                        },
                      );
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
