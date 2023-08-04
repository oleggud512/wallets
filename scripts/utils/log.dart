// Blue text
void printInfo(Object? object) {
  print('\x1B[34m${object.toString()}\x1B[0m');
}

// Green text
void printSuccess(Object? object) {
  print('\x1B[32m${object.toString()}\x1B[0m');
}

// Yellow text
void printWarning(Object? object) {
  print('\x1B[33m${object.toString()}\x1B[0m');
}

// Red text
void printError(Object? object) {
  print('\x1B[31m${object.toString()}\x1B[0m');
}
