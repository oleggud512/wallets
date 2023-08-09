import 'dart:io';
import 'package:watcher/watcher.dart' as w;

import 'utils/log.dart';

Future<void> main() async {
  const dir = 'assets/translations';
  final watcher = w.DirectoryWatcher(dir, 
    pollingDelay: const Duration(seconds: 1)
  );

  printInfo('Watching to file changes in $dir');
  await run();
  
  watcher.events.listen((event) {
    printInfo('file ${event.path} changed. [${event.type}]');
    run();
  });
}

Future<void> run() async {
printInfo('Generating keys...');
  Process.run('dart', [
    'run', 
    'easy_localization:generate', 
    '--source-dir', 
    'assets/translations', 
    '--output-dir', 
    'lib/src/core/presentation/localization', 
    '-f', 
    'keys', 
    '-o', 
    'locale_keys.g.dart'
  ]).then((res) {
    if (res.exitCode == 0) {
      if (res.stdout.isNotEmpty) print(res.stdout);
      printSuccess('Keys generated successfully.');
    } else {       
      if (res.stderr.isNotEmpty) print(res.stderr);
      printError('Failed to generate keys.');
    }
  });
  printInfo('Generating loader...');
  Process.run('dart', [
    'run', 
    'easy_localization:generate', 
    '--source-dir', 
    'assets/translations', 
    '--output-dir', 
    'lib/src/core/presentation/localization'
  ]).then((res) {
    if (res.exitCode == 0) {
      if (res.stdout.isNotEmpty) print(res.stdout);
      printSuccess('Loader generated successfully.');
    } else {
      if (res.stderr.isNotEmpty) print(res.stderr);
      printError('Failed to generate loader.');
    }
  });
}

