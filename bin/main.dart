import 'dart:async';
import 'dart:io';
import 'package:big_dog/casino.dart';
import 'package:erebus/erebus.dart';
import 'package:yaml/yaml.dart';

Future<void> main() async {
  final configFile = new File('config.yaml');
  final config = loadYaml(configFile.readAsStringSync());
  final options = FrameworkClientOptions(
      prefixes: config['prefixes'].toList().cast<String>());
  final token = config['token'];

  final client = FrameworkClient(token, options);

  client.onDebug.listen(print);
  print(options.prefixes.map((p) => p.runtimeType));

  final userService = UserService();
  client.services.register(userService);
  client.commands.registerGroup(AccountCommandGroup(userService));
  client.commands.registerGroup(MiscCommandGroup());
  client.commands.registerGroup(GamblingCommandGroup(userService));

  await client.connect();
}
