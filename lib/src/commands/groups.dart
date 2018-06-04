import 'package:erebus/erebus.dart';
import 'package:erebus/command.dart';
import '../../casino.dart';
import 'account/balance.dart';
import 'account/help.dart';
import 'gambling/flip.dart';
import 'misc/dog.dart';
import 'misc/id.dart';
import 'misc/invite.dart';
export 'misc/ping.dart';

class AccountCommandGroup extends CommandGroup {
  final name = 'account';

  List<Command> get commands => [BalanceCommand(userService), HelpCommand()];

  final UserService userService;

  AccountCommandGroup(this.userService);
}

class GamblingCommandGroup extends CommandGroup {
  final name = 'gambling';

  List<Command> get commands => [FlipCommand(userService)];
  
  final UserService userService;

  GamblingCommandGroup(this.userService);
}

class MiscCommandGroup extends CommandGroup {
  final name = 'misc';

  List<Command> get commands => [PingCommand(), DogCommand(), InviteCommand(), IdCommand()];

  MiscCommandGroup();
}