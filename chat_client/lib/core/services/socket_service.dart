import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static SocketService? _instance;
  IO.Socket? socket;

  static SocketService get instance {
    if (_instance == null) {
      _instance = SocketService._init();
    }

    return _instance!;
  }

  SocketService._init();

  void initialize(String path) {
    socket = IO.io(
      path,
      IO.OptionBuilder().setTransports(["websocket"]).disableAutoConnect().build(),
    );
  }

  void connect() {
    socket!.connect();
  }
}
