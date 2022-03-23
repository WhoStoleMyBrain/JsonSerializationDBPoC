import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_serialization_db_poc/helpers/database_loader.dart';
import 'package:json_serialization_db_poc/models/card_info.dart';
import 'package:json_serialization_db_poc/models/user.dart';

class MyContent extends StatefulWidget {
  const MyContent({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyContent> createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {
  bool isLoading = false;
  bool isUser = true;
  List<User> users = [];
  List<CardInfo> cards = [];
  Map<String, dynamic> user_1 = {
    'name': 'Marco',
    'email': 'Marco@internet.com'
  };
  Map<String, dynamic> user_2 = {
    'name': 'Leonie',
    'email': 'Leonie@internet.com'
  };
  Map<String, dynamic> user_3 = {
    'name': 'Etienne',
    'email': 'Etienne@internet.com'
  };
  Map<String, dynamic> user_4 = {
    'name': 'Nora',
    'email': 'Nora@internet.com',
  };

  void getUsers() {
    print('getting users dummy data...');
    users = [
      User.fromJson(user_1),
      User.fromJson(user_2),
      User.fromJson(user_3),
      User.fromJson(user_4),
    ];
    setState(() {
      isLoading = false;
      isUser = true;
    });
  }

  void getCards() {
    print('getting cards dummy data...');
    cards =
        DatabaseLoader.cardDummyData.map((e) => CardInfo.fromJson(e)).toList();
    setState(() {
      isLoading = false;
      isUser = false;
    });
  }

  Future<void> getUsersFromDB() async {
    print('getting users from db...');
    setState(() {
      isLoading = true;
    });
    final List dataBaseList = await DatabaseLoader.readDataFromDBFile(
        DatabaseLoader.userDatabasePath);
    users = dataBaseList.map((e) => User.fromJson(e)).toList();
    setState(() {
      isLoading = false;
      isUser = true;
    });
  }
  // - 64/27 + 64/9 + 16/3 - 16
  // = -64/27 + 192/27 + 144/27 - 16
  // = 128/27 + 144/27  - 16
  // = 272/27 - 16

  Future<void> getCardsFromDB() async {
    print('getting cards from db...');
    setState(() {
      isLoading = true;
    });
    final List dataBaseList = await DatabaseLoader.readDataFromDBFile(
        DatabaseLoader.cardDatabasePath);
    // cards = dataBaseList.map((e) => CardInfo.fromJson(e)).toList();
    cards = dataBaseList.map((e) {
      // print(e);
      // print(e?['card_faces']);
      // print(e?['card_faces'].toString());
      // print(e?['card_faces']?[0]?['image_uris']);
      // e?.forEach((elem) {print(elem);});
      return CardInfo.fromJson(e);
    }).toList();
    // cards.forEach((element) { });
    // print(cards[0].imageUris?.toJson());
    setState(() {
      isLoading = false;
      isUser = false;
    });
  }

  void _printCurrentlyRelevantData(int index) {
    print(cards[index].imageUris?.toJson());

    cards[index].cardFaces?.forEach((element) {
      print(element?.toJson());
    });
    print(cards[index].hasTwoSides);
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          TextButton(
              onPressed: getUsers,
              child: const Text(
                'User',
                style: TextStyle(color: Colors.black),
              )),
          TextButton(
              onPressed: getUsersFromDB,
              child: const Text(
                'User DB',
                style: TextStyle(color: Colors.black),
              )),
          TextButton(
              onPressed: getCards,
              child: const Text(
                'Cards',
                style: TextStyle(color: Colors.black),
              )),
          TextButton(
            onPressed: getCardsFromDB,
            child: const Text(
              'Cards DB',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: isUser
                  ? ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Name: ${users[index].name}'),
                          subtitle: Text('E-Mail: ${users[index].email}'),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('CardName: ${cards[index].name}'),
                          // subtitle: Text('CardId: ${cards[index].id}'),
                          subtitle: Text('CardId: ${cards[index].oracleId}'),
                          leading: Text('\$${cards[index].prices?.usd}'),
                          onTap: () {
                            _printCurrentlyRelevantData(index);
                          },
                        );
                      }),
            ),
    );
  }
}
