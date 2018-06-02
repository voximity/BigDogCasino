import 'package:erebus/command.dart';

class InviteCommand extends Command {
  final names = ['invite', 'oauth'];

  final args = [];

  InviteCommand();
  
  void execute(context, args) {
  final message = context.message;
  final response = context
      .respond((message) => message..content = 'Yeah my dude here\'s the Oauth: https://discordapp.com/api/oauth2/authorize?client_id=449749555505004545&permissions=8&scope=bot')
      .send();
  }
}