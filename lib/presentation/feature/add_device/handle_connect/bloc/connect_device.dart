class DeviceConnect {
  DeviceConnect({
    this.id = '',
    this.connectValue = 0,
    this.connected = false,
  });

  String id;
  int connectValue;
  bool connected;

  DeviceConnect copyWith({
    String? id,
    int? connectValue,
    bool? connected,
  }) {
    return DeviceConnect(
      id: id ?? this.id,
      connectValue: connectValue ?? this.connectValue,
      connected: connected ?? this.connected,
    );
  }
}
