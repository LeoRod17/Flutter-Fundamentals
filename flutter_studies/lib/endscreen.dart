import 'package:flutter/material.dart';

class Adios extends StatelessWidget {
  const Adios({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (details) {
        final anchoPantalla = MediaQuery.of(context).size.width;
        final posicionX = details.localPosition.dx;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/GIF/Star wars gif.gif',
                fit: BoxFit.cover,
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Gracias por llegar al final del projecto',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
