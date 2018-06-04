import 'package:big_dog/casino.dart';
import 'package:erebus/command.dart';
import 'package:erebus/erebus.dart';

class HelpCommand extends Command {
  final names = ['help', 'commands', 'cmd'];

  final args = [];

  HelpCommand();

  Future<void> execute(context, args) async {
    final message = context.message;
    final pingMessage = await context
        .respond((message) => message
          ..content =
              'Here\'s a list of all available commands, all use the prefix `bdc` or `🌭`.\n```<Name of Command> <arguments> - <usage> \nping - Standard pinng command. \ndog - Dog! \nbalance - Checks your current balance. \ninvite - Returns a link to invite Big Dog Casino to a server. \nflip <side> <bet amount> - Bets a certain amount of 🐶 on the flip of a coin.```')
        .send()
        .then((snowflake) => message);
  }
}
