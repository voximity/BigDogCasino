import 'dart:math';
import 'package:erebus/command.dart';
import '../../../casino.dart';

class FlipCommand extends Command {
  final names = ['flip'];

  final args = [Argument('side'), Argument('bet')];

  final UserService userService;

  final random = Random();

  FlipCommand(this.userService);

  Future<void> execute(context, args) async {
    final bet = await args['bet'].resolve(Resolver.integer(min : 1));
    final account = await userService.getAccount(context.message.author.id);
    final reward = random.nextBool() ? (bet) : (bet * -1);
    
    if (bet > account.balance) {
      await context
      .respond((message) => message
        ..content = 'You don\'t have enough 🐶!')
      .send();
      return;
      }
    else {
    await context
        .respond((message) => message
          ..content = 'you ${reward >= 0 ? 'Won' : 'lost'} ${(reward.abs())}')
        .send();
     await account.update({'balance': account.balance + reward});   
  }
}
}