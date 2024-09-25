import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'widgets/control_bt.dart';
import 'widgets/info_device.dart';
import 'widgets/list_devices.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothPage extends StatefulWidget {
  final BluetoothConnection? connection;
  final bool isConnecting;
  final BluetoothDevice? deviceConnected;
  final Function(BluetoothConnection, BluetoothDevice) setConnection;
  final VoidCallback clearConnection; // Cambiamos Function a VoidCallback

  const BluetoothPage({
    super.key,
    required this.connection,
    required this.isConnecting,
    required this.deviceConnected,
    required this.setConnection,
    required this.clearConnection,
  });

  @override
  State<BluetoothPage> createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  final _bluetooth = FlutterBluetoothSerial.instance;
  bool _bluetoothState = false;
  List<BluetoothDevice> _devices = [];
  bool _isConnecting = false;

  @override
  void initState() {
    super.initState();
    _requestPermission();
    _bluetooth.state.then((state) {
      setState(() => _bluetoothState = state.isEnabled);
    });

    _bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BluetoothState.STATE_OFF:
          setState(() => _bluetoothState = false);
          break;
        case BluetoothState.STATE_ON:
          setState(() => _bluetoothState = true);
          break;
      }
    });
  }

  void _requestPermission() async {
    await Permission.location.request();
    await Permission.bluetooth.request();
    await Permission.bluetoothScan.request();
    await Permission.bluetoothConnect.request();
  }

  void _getDevices() async {
    var res = await _bluetooth.getBondedDevices();
    setState(() => _devices = res);
  }

  void _connectToDevice(BluetoothDevice device) async {
    setState(() => _isConnecting = true);
    final connection = await BluetoothConnection.toAddress(device.address);
    widget.setConnection(connection, device);
    setState(() => _isConnecting = false);
    connection.input?.listen((event) {
      String receivedString = String.fromCharCodes(event);
      if (receivedString.startsWith("ldr:")) {
        // Handle LDR data if needed
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ControlBT(
          bluetoothState: _bluetoothState,
          onChanged: (value) async {
            if (value) {
              await _bluetooth.requestEnable();
            } else {
              await _bluetooth.requestDisable();
            }
            setState(() => _bluetoothState = value);
          },
        ),
        InfoDevice(
          deviceConnected: widget.deviceConnected,
          connection: widget.connection,
          onGetDevices: _getDevices,
          onDisconnect: widget.clearConnection, // Ahora es VoidCallback
        ),
        Expanded(
          child: ListDevices(
            devices: _devices,
            isConnecting: _isConnecting,
            onConnect: _connectToDevice,
          ),
        ),
      ],
    );
  }
}
