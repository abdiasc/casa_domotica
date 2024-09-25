import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ControlBT extends StatelessWidget {
  final bool bluetoothState;
  final ValueChanged<bool> onChanged;

  const ControlBT({
    super.key, // Usar super.key en lugar de key
    required this.bluetoothState,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 1, 36, 65),
      padding: const EdgeInsets.all(5),
      child: SwitchListTile(
        activeColor: const Color.fromARGB(255, 199, 1, 44),
        activeTrackColor: Colors.white,
        value: bluetoothState,
        onChanged: onChanged,
        tileColor: Colors.black26,
        secondary: SvgPicture.asset(
          'assets/images/bluetooth2.svg', // Ruta del archivo SVG en tu proyecto
          width: 30.0,
          height: 30.0,
          color: const Color.fromARGB(255, 224, 224, 223),
        ),
        title: Text(
          bluetoothState ? "Bluetooth encendido" : "Bluetooth apagado",
          style: const TextStyle(
            color: Color.fromARGB(255, 235, 236, 231),
          ),
        ),
      ),
    );
  }
}
