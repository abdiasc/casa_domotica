import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LDRWidget extends StatelessWidget {
  final int currentLdrValue;

  const LDRWidget({
    super.key, // Usar super.key en lugar de key
    required this.currentLdrValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 17, 43, 18),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                const Text(
                  "TEMPERATURA",
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: SvgPicture.asset(
                          'assets/images/temperature.svg', // Ruta del archivo SVG en tu proyecto
                          width: 30.0,
                          height: 30.0,
                          color: const Color.fromARGB(255, 235, 200, 2),
                        ),
                      ),
                      Text(
                        "$currentLdrValue º",
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                const Text(
                  "MOVIMIENTO",
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: SvgPicture.asset(
                          'assets/images/move.svg', // Ruta del archivo SVG en tu proyecto
                          width: 30.0,
                          height: 30.0,
                          color: const Color.fromARGB(255, 235, 200, 2),
                        ),
                      ),
                      const Text(
                        "Detectado",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
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
