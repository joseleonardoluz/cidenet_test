import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketService {
  ServerStatus _serverStatus = ServerStatus.Connecting;

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    // Dart client
    IO.Socket socket = IO.io('http://localhost:3002', {
      'transposrts' : ['websockets'],
      'autoConnect' : true,

    });
    socket.onConnect((_) {
      print('connect');
    });
    socket.onDisconnect((_) => print('disconnect'));
  }
}
