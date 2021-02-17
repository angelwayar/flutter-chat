import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid
      ? 'https://flutter-chat-server-casaclub.herokuapp.com/api'
      : 'https://flutter-chat-server-casaclub.herokuapp.com/api';

  static String socketUrl = Platform.isAndroid
      ? 'https://flutter-chat-server-casaclub.herokuapp.com/'
      : 'https://flutter-chat-server-casaclub.herokuapp.com/';
}
