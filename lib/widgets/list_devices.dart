import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ListDevices extends StatelessWidget {
  final List<BluetoothDevice> devices;
  final bool isConnecting;
  final ValueChanged<BluetoothDevice> onConnect;

  const ListDevices({
    super.key, // Usar super.key en lugar de key
    required this.devices,
    required this.isConnecting,
    required this.onConnect,
  });

  @override
  Widget build(BuildContext context) {
    return isConnecting
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Container(
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  ...[
                    for (final device in devices)
                      ListTile(
                        title: Text(device.name ?? device.address),
                        trailing: TextButton(
                          child: const Text('conectar'),
                          onPressed: () => onConnect(device),
                        ),
                      )
                  ]
                ],
              ),
            ),
          );
  }
}
