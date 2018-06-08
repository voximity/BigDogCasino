import 'dart:async';
import 'package:discidium/discord.dart';
import 'package:erebus/service.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../commands/account/daily.dart';

class UserAccount {
  final UserService service;
  final UserSnowflake id;
  final Map<String, dynamic> document;

  int get balance => document['balance'];
  DateTime get lastDaily => document['lastDaily'];

  UserAccount(this.service, this.id, this.document);

  Future<UserAccount> update(Map<String, dynamic> data) =>
      service.updateAccount(id, data);
}

class UserService extends Service {
  final name = 'users';
  final Db db = Db('mongodb://localhost:27017/casino');
  DbCollection get users => db.collection('users');

  Future<void> setup(client) async {
    await db.open();
  }

  Future<UserAccount> getAccount(UserSnowflake id) async {
    var user = await users.findOne({'_id': id.toString()});

    if (user == null) {
      user = await users.insert({'_id': id.toString(), 'balance': 0, 'lastDaily': DateTime.now().subtract(DailyCommand.dailyDuration)});
    }

    return UserAccount(this, id, user);
  }

  Future<UserAccount> updateAccount(
      UserSnowflake id, Map<String, dynamic> data) async {
    final user = await users.update({'_id': id.toString()}, data);
    return UserAccount(this, id, user);
  }
}
