import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Luces extends StatelessWidget {
  final bool switchValueSala;
  final bool switchValueCocina;
  final bool switchValueDormitorio;
  final bool switchValueDormitorioPrincipal;
  final bool switchValuePasillo;
  final bool switchValueEntrada;
  final Function(String, bool) onSwitchChanged;

  const Luces({
    super.key, // Usar super.key en lugar de key
    required this.switchValueSala,
    required this.switchValueCocina,
    required this.switchValueDormitorio,
    required this.switchValueDormitorioPrincipal,
    required this.switchValuePasillo,
    required this.switchValueEntrada,
    required this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 1, 36, 65),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: SvgPicture.asset(
                    'assets/images/home.svg', // Ruta del archivo SVG en tu proyecto
                    width: 30.0,
                    height: 30.0,
                    color: const Color.fromARGB(255, 224, 224, 223),
                  ),
                ),
                const Text(
                  'LUCES CASA',
                  style: TextStyle(
                    color: Color.fromARGB(255, 235, 236, 231),
                    fontSize: 18,
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          switchSala(),
          switchCocina(),
          switchDormitorio(),
          switchDormitorioPrincipal(),
          switchPasillo(),
          switchPrincipal(),
        ],
      ),
    );
  }

  Widget switchSala() {
    return SwitchListTile(
      activeColor: const Color.fromARGB(255, 199, 1, 44),
      activeTrackColor: Colors.white,
      secondary: SvgPicture.asset(
        'assets/images/sala.svg', // Ruta del archivo SVG en tu proyecto
        width: 25.0,
        height: 25.0,
        color: const Color.fromARGB(255, 224, 224, 223),
      ),
      title: const Text(
        "Sala",
        style: TextStyle(
          color: Color.fromARGB(255, 243, 243, 241),
        ),
      ),
      value: switchValueSala,
      onChanged: (bool value) {
        onSwitchChanged('Sala', value);
      },
    );
  }

  Widget switchCocina() {
    return SwitchListTile(
      activeColor: const Color.fromARGB(255, 199, 1, 44),
      activeTrackColor: Colors.white,
      secondary: SvgPicture.asset(
        'assets/images/cocina.svg', // Ruta del archivo SVG en tu proyecto
        width: 25.0,
        height: 25.0,
        color: const Color.fromARGB(255, 224, 224, 223),
      ),
      title: const Text(
        "Cocina",
        style: TextStyle(
          color: Color.fromARGB(255, 243, 243, 241),
        ),
      ),
      value: switchValueCocina,
      onChanged: (bool value) {
        onSwitchChanged('Cocina', value);
      },
    );
  }

  Widget switchDormitorio() {
    return SwitchListTile(
      activeColor: const Color.fromARGB(255, 199, 1, 44),
      activeTrackColor: Colors.white,
      secondary: SvgPicture.asset(
        'assets/images/habitacion.svg', // Ruta del archivo SVG en tu proyecto
        width: 25.0,
        height: 25.0,
        color: const Color.fromARGB(255, 224, 224, 223),
      ),
      title: const Text(
        "Dormitorio",
        style: TextStyle(
          color: Color.fromARGB(255, 243, 243, 241),
        ),
      ),
      value: switchValueDormitorio,
      onChanged: (bool value) {
        onSwitchChanged('Dormitorio', value);
      },
    );
  }

  Widget switchDormitorioPrincipal() {
    return SwitchListTile(
      activeColor: const Color.fromARGB(255, 199, 1, 44),
      activeTrackColor: Colors.white,
      secondary: SvgPicture.asset(
        'assets/images/dormitorio_principal.svg', // Ruta del archivo SVG en tu proyecto
        width: 25.0,
        height: 25.0,
        color: const Color.fromARGB(255, 224, 224, 223),
      ),
      title: const Text(
        "Dormitorio Principal",
        style: TextStyle(
          color: Color.fromARGB(255, 243, 243, 241),
        ),
      ),
      value: switchValueDormitorioPrincipal,
      onChanged: (bool value) {
        onSwitchChanged('DormitorioPrincipal', value);
      },
    );
  }

  Widget switchPasillo() {
    return SwitchListTile(
      activeColor: const Color.fromARGB(255, 199, 1, 44),
      activeTrackColor: Colors.white,
      secondary: SvgPicture.asset(
        'assets/images/pasillo.svg', // Ruta del archivo SVG en tu proyecto
        width: 25.0,
        height: 25.0,
        color: const Color.fromARGB(255, 224, 224, 223),
      ),
      title: const Text(
        "Pasillo",
        style: TextStyle(
          color: Color.fromARGB(255, 243, 243, 241),
        ),
      ),
      value: switchValuePasillo,
      onChanged: (bool value) {
        onSwitchChanged('Pasillo', value);
      },
    );
  }

  Widget switchPrincipal() {
    return SwitchListTile(
      activeColor: const Color.fromARGB(255, 199, 1, 44),
      activeTrackColor: Colors.white,
      secondary: SvgPicture.asset(
        'assets/images/puerta.svg', // Ruta del archivo SVG en tu proyecto
        width: 25.0,
        height: 25.0,
        color: const Color.fromARGB(255, 224, 224, 223),
      ),
      title: const Text(
        "Entrada Principal",
        style: TextStyle(
          color: Color.fromARGB(255, 243, 243, 241),
        ),
      ),
      value: switchValueEntrada,
      onChanged: (bool value) {
        onSwitchChanged('EntradaPrincipal', value);
      },
    );
  }
}
