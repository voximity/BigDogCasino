import 'package:erebus/command.dart';
import '../../../casino.dart';

class DailyCommand extends Command {
  final names = ['daily', 'givemoney'];
  final args = [];
  final UserService userService;
  static const Duration dailyDuration = const Duration(days: 1);
  static const int dailyReward = 50;

  DailyCommand(this.userService);

  String humanizeDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    final hours = duration.inHours;
    final minutes =
        twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
    final seconds =
        twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
    return '$hours:$minutes:$seconds';
  }

  Future<void> execute(context, args) async {
    final account = await userService.getAccount(context.message.author.id);
    final nextDaily = account.lastDaily.add(dailyDuration);

    if (nextDaily.isAfter(DateTime.now())) {
      final difference = nextDaily.difference(DateTime.now());
      await context
          .respond((message) => message
            ..content =
                'You can get your next daily in ${humanizeDuration(difference)}!')
          .send();
      return;
    }
    await account.update({
      'balance': account.balance + dailyReward,
      'lastDaily': DateTime.now()
    });
    await context
        .respond((message) =>
            message..content = 'your daily of 🐶50 has been added to your account!')
        .send();
  }
}
