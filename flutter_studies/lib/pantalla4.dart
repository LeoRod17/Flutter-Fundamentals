import 'package:flutter/material.dart';
import 'pantalla5.dart';

class Pantalla4 extends StatefulWidget {
  const Pantalla4({super.key});

  @override
  State<Pantalla4> createState() => _Pantalla4State();
}

class _Pantalla4State extends State<Pantalla4> {
  final List<String> nombres = [
    'Luke Skywalker',
    'Leia Organa',
    'Han Solo',
    'Darth Vader',
    'Obi-Wan Kenobi',
    'Anakin Skywalker',
    'Yoda',
    'Bail Organa',
    'Bastila Shan',
    'Kyle Katarn',
    'Ezra Bridger',
    'Kanan Jarus',
    'Gallen Marik (Starkiller))',
    'Revan',
    'Malak',
    'Wedge Antiles',
    'Qui-gon Jinn',
  ];
  int indiceActual = 0;
  void siguienteNombre() {
    setState(() {
      indiceActual = (indiceActual + 1) % nombres.length;
    });
  }

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
            MaterialPageRoute(builder: (context) => const Pantalla5()),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/wallpaper/revan.png',
                fit: BoxFit.cover,
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nombres[indiceActual],
                    style: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: ElevatedButton(
                  onPressed: siguienteNombre,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/icons/X-wingicon.png'),
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
