import 'package:flutter/material.dart';
import 'widgets/ldr_widget.dart';
import 'widgets/luces.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LdrLucesPage extends StatefulWidget {
  final Function(String) sendData;

  const LdrLucesPage({
    super.key,
    required this.sendData,
  });

  @override
  State<LdrLucesPage> createState() => _LdrLucesPageState();
}

class _LdrLucesPageState extends State<LdrLucesPage> {
  int ldrValue = 0;
  bool switchValueSala = false;
  bool switchValueCocina = false;
  bool switchValueDormitorio = false;
  bool switchValueDormitorioPrincipal = false;
  bool switchValuePasillo = false;
  bool switchValueEntrada = false;
  bool portonAbierto = false;

  void _onSwitchChanged(String room, bool value) {
    setState(() {
      switch (room) {
        case 'Sala':
          switchValueSala = value;
          widget.sendData(value ? "1" : "0");
          break;
        case 'Cocina':
          switchValueCocina = value;
          widget.sendData(value ? "2" : "3");
          break;
        case 'Dormitorio':
          switchValueDormitorio = value;
          widget.sendData(value ? "4" : "5");
          break;
        case 'DormitorioPrincipal':
          switchValueDormitorioPrincipal = value;
          widget.sendData(value ? "6" : "7");
          break;
        case 'Pasillo':
          switchValuePasillo = value;
          widget.sendData(value ? "8" : "9");
          break;
        case 'Porton':
          portonAbierto = value;
          widget.sendData(
              value ? "B" : "A"); // Envía un comando diferente para el portón
          break;
        case 'EntradaPrincipal':
          switchValueEntrada = value;
          widget.sendData(value ? "D" : "C");
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          LDRWidget(currentLdrValue: ldrValue),
          Luces(
            switchValueSala: switchValueSala,
            switchValueCocina: switchValueCocina,
            switchValueDormitorio: switchValueDormitorio,
            switchValueDormitorioPrincipal: switchValueDormitorioPrincipal,
            switchValuePasillo: switchValuePasillo,
            switchValueEntrada: switchValueEntrada,
            onSwitchChanged: _onSwitchChanged,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 1, 36, 65),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: SvgPicture.asset(
                        'assets/images/garage.svg', // Ruta del archivo SVG en tu proyecto
                        width: 25.0,
                        height: 25.0,
                        color: const Color.fromARGB(255, 224, 224, 223),
                      ),
                    ),
                    const Text(
                      "PORTON",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Switch(
                      value: portonAbierto,
                      onChanged: (value) {
                        _onSwitchChanged('Porton', value);
                      },
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.red,
                      inactiveTrackColor: Colors.grey,
                    ),
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: SvgPicture.asset(
                          'assets/images/light.svg', // Ruta del archivo SVG en tu proyecto
                          width: 25.0,
                          height: 25.0,
                          color: const Color.fromARGB(255, 224, 224, 223),
                        ),
                      ),
                      const Text(
                        "LUCES EXTERIOR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const Text(
                        "Pulsador presionado (x)",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
