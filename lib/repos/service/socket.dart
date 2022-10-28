import 'package:socket_io_client/socket_io_client.dart' as IO;

class Socket {
  late IO.Socket socket;
  String uri = "http://192.168.1.119:5000";
  //String uri = "http://localhost:5000";
  //
  Socket();
  // declare
  void declareSocket() {
    print("call func");
    socket = IO.io(
        uri,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket.onConnect((_) {
      print("connect");
      socket.emit('msg', 'test connect from client');
    });
    socket.onDisconnect((_) => print('disconnect'));
    socket.onConnectError((data) => print('connect error' + data.toString()));
    socket.onConnecting((data) => print('connecting to server'));
  }

  // connect
  void connectServer() {
    if (!socket.connected) {
      socket.connect();
    }
  }

  //
  void sendToServer() {}

  // disconnect
  void disconnectServer() {
    if (!socket.disconnected) {
      socket.disconnect();
    }
  }

  // listen
}
