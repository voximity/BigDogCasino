import 'package:erebus/command.dart';
import '../../../casino.dart';

class BalanceCommand extends Command {
  final names = ['balance', 'bal', 'ance'];

  final args = [];

  final UserService userService;

  BalanceCommand(this.userService);

  Future<void> execute(context, args) async {
    context.message.author.id;

    userService.getAccount(context.message.author.id);

    final account = await userService.getAccount(context.message.author.id);

    await context
        .respond(
            (message) => message..content = 'you have 🐶${account.balance}')
        .send();
  }
}
