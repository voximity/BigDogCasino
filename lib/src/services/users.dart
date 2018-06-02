import 'dart:async';
import 'package:discidium/discord.dart';
import 'package:erebus/service.dart';
import 'package:mongo_dart/mongo_dart.dart';

class UserAccount {
  final UserService service;
  final Map document;

  int get balance => document['balance'];

  UserAccount(this.service, this.document);
}

class UserService extends Service {
  final Db db = Db('mongodb://localhost:27017/casino');
  final name = 'users';

  Future<void> setup(client) async {
    await db.open();
  }

  Future<UserAccount> getAccount(UserSnowflake id) async {
    final users = db.collection('users');
    var user = await users.findOne({'_id': id.toString()});

    if (user == null) {
      user = await users.insert({'_id': id.toString(), 'balance': 0});
    }

    return UserAccount(this, user);
  }
}
