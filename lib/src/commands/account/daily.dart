import 'package:erebus/command.dart';
import '../../../casino.dart';

class DailyCommand extends Command {
  final names = ['daily', 'givemoney'];

  final args = [];

  final UserService userService;

  DailyCommand(this.userService);

  Future<void> execute(context, args) async {
  final account = await userService.getAccount(context.message.author.id);
  final thisDaily = new DateTime.now();
  final nextDaily = thisDaily.add(new Duration(hours: 23));
  Duration difference = thisDaily.difference(nextDaily);
  

  }
}