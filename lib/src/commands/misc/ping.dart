import 'package:erebus/command.dart';

class PingCommand extends Command {
  final names = ['ping'];

  final args = [];

  PingCommand();

  Future<void> execute(context, args) async {
    final message = context.message;
    final pingMessage = await context
        .respond((message) => message..content = 'Dog!')
        .send()
        .then((snowflake) => message);

    final pingTime = pingMessage.sentAt.difference(message.sentAt).inMilliseconds;

    await context
        .respond((message) => message..content = 'Dog! `$pingTime ms`')
        .send();
  }
}