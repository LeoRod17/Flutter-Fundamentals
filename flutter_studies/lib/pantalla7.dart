import 'package:flutter/material.dart';
import './pantalla8.dart';

class Pantalla7 extends StatelessWidget {
  final String nomb;
  final String frase;
  final String description;
  final String faction;

  const Pantalla7({
    super.key,
    required this.nomb,
    required this.frase,
    required this.description,
    required this.faction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (details) {
        final anchoPantalla = MediaQuery.of(context).size.width;
        final posicionX = details.localPosition.dx;

        if (posicionX < anchoPantalla / 2) {
          Navigator.pop(context);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyApp()),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(nomb)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nomb,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                frase,
                style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                description,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Image.asset(faction, width: 100, height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
