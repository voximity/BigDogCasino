import 'dart:math';
import 'package:erebus/command.dart';
import '../../../casino.dart';

class FlipCommand extends Command {
  final names = ['flip'];

  final args = [Argument('side'), Argument('bet')];

  final UserService userService;

  final random = new Random().nextBool();

  FlipCommand();

  Future<void> execute(context, args) async {
    final bet = await args['bet'].resolve(Resolver.integer());
    userService.getAccount(context.message.author.id);
    final account = userService.getAccount(context.message.author.id);

    if (random == true) {
      
          await context
        .respond(
            (message) => message..content = 'you won 🐶${bet * 2}')
        .send();
    }
    else {
                await context
        .respond(
            (message) => message..content = 'you lost 🐶$bet')
        .send();
    }



  }
}
