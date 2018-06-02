import 'package:erebus/command.dart';

class DogCommand extends Command {
  final names = ['dog'];

  final args = [];

  DogCommand();

  Future<void> execute(context, args) async {
      await context
        .respond(
            (message) => message..content = 'Dog!')
        .send();
  }
}
