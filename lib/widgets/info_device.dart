import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class InfoDevice extends StatelessWidget {
  final BluetoothDevice? deviceConnected;
  final BluetoothConnection? connection;
  final VoidCallback onGetDevices; // Cambiado a VoidCallback
  final VoidCallback onDisconnect; // Cambiado a VoidCallback

  const InfoDevice({
    super.key,
    required this.deviceConnected,
    required this.connection,
    required this.onGetDevices,
    required this.onDisconnect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ListTile(
        tileColor: Colors.black12,
        title: Text("Conectado a: ${deviceConnected?.name ?? "ninguno"}"),
        trailing: connection?.isConnected ?? false
            ? TextButton(
                onPressed: onDisconnect,
                child: const Text("Desconectar"),
              )
            : TextButton(
                onPressed: onGetDevices,
                child: const Text("Ver dispositivos"),
              ),
      ),
    );
  }
}
