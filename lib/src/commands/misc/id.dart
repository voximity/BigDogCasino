import 'package:erebus/command.dart';
import '../../../casino.dart';

class IdCommand extends Command {
  final names = ['id'];

  final args = [];

  IdCommand();

  Future<void> execute(context, args) async {
    context.message.author.id.toString();

    final authorid = context.message.author.id.toString();

    await context
        .respond(
            (message) => message..content = 'your id is $authorid')
        .send();
  }
}
