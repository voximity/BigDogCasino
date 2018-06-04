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
    final bet = await args['bet'].resolve(Resolver.integer());
    final account = await userService.getAccount(context.message.author.id);
    final reward = random.nextBool() ? (bet * 2) : (bet * -1);
    await account.update({'balance': account.balance + reward});
    await context
        .respond((message) => message
          ..content = 'you ${reward >= 0 ? 'won' : 'lost'} ${(reward.abs())}')
        .send();
  }
}
