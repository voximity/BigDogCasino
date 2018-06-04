import 'package:erebus/command.dart';
import '../../../casino.dart';

class DailyCommand extends Command {
  final names = ['daily', 'givemoney'];

  final args = [];

  final UserService userService;

  DailyCommand();

  Future<void> execute(context, args) async {
  final account = await userService.getAccount(context.message.author.id);
  final dailyMessage =
    await context
        .respond((message) => message..content = 'You recieved your daily 🐶!')
        .send();
        account.update({'balance': account.balance + 50}); 
  }
}