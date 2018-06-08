import 'package:erebus/command.dart';

class PingCommand extends Command {
  final names = ['ping'];

  final args = [];

  PingCommand();

  Future<void> execute(context, args) async {
    final message = context.message;
    final stopwatch = Stopwatch();
    stopwatch.start();
    await context
        .respond((message) => message..content = 'Dog!')
        .send()
        .then((snowflake) => message);
    final pingTime = stopwatch.elapsedMilliseconds;
    await context
        .respond((message) => message..content = 'Dog! `$pingTime ms`')
        .send();
  }
}
