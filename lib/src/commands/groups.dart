import 'package:erebus/erebus.dart';
import 'package:erebus/command.dart';
import '../../casino.dart';
import 'account/balance.dart';
import 'misc/dog.dart';
import 'misc/invite.dart';
export 'misc/ping.dart';

class AccountCommandGroup extends CommandGroup {
  final name = 'account';

  List<Command> get commands => [BalanceCommand(userService)];

  final UserService userService;

  AccountCommandGroup(this.userService);
}

class MiscCommandGroup extends CommandGroup {
  final name = 'misc';

  List<Command> get commands => [PingCommand(), DogCommand(), InviteCommand()];

  MiscCommandGroup();
}