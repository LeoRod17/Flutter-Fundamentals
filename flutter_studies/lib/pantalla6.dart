import 'package:flutter/material.dart';
import 'pantalla7.dart';

class Pantalla6 extends StatefulWidget {
  const Pantalla6({super.key});

  @override
  State<Pantalla6> createState() => _Pantalla6State();
}

class _Pantalla6State extends State<Pantalla6> {
  final TextEditingController _controller = TextEditingController();

  final List<Favorito> _favorito = [
    Favorito(
      'Luke Skywalker',
      'I am a jedi like my father before me.',
      'The most powerfull jedi EVER',
      'assets/icons/jediicon.jpg',
    ),
    Favorito(
      'Darth Vader',
      'I find your lack of faith disturbing.',
      'The biggest jedi killer in the history of the galaxy',
      'assets/icons/empireicon.jpeg',
    ),
    Favorito(
      'Anakin Skywalker',
      'This is where the fun begins',
      'The choseen one, the hero with no fear and the best pilot in the galaxy',
      'assets/icons/jediicon.jpg',
    ),
    Favorito(
      'Han Solo',
      'Never tell me the odds',
      'The smuggler with a heart of gold and one of the greatest pilots to ever live',
      'assets/icons/outlawicon.jpg',
    ),
    Favorito(
      'Obi-wan kenobi',
      'Hello there',
      'The master of the choseen one, the negotiator and the jedi who fought the most siths during the clone wars',
      'assets/icons/jediicon.jpg',
    ),
    Favorito(
      'Yoda',
      'Do. Or do not. There is no try',
      'The grand master of the jedi order during the clone wars who had to go into exile after order 66',
      'assets/icons/jediicon.jpg',
    ),
    Favorito(
      'Leia Organa',
      'Help me, Obi-Wan Kenobi. You’re my only hope',
      'Adopted child of the princess and senator of alderan, she depending of the timeline is a general or one of the most important politicians but she is always fighting for the galaxy',
      'assets/icons/Rebelicon.webp',
    ),
    Favorito(
      'Padme Amidala',
      'This is how liberty dies … with thunderous applause',
      'The former queen of naboo, later became a senator who preached for peace during the clone wars',
      'assets/icons/empireicon.jpeg',
    ),
    Favorito(
      'Boba Fett',
      'Like a Bantha',
      'the most dangerous bounty hunter in the galaxy',
      'assets/icons/bountyhuntericon.jpg',
    ),
    Favorito(
      'Sheev Palpatine',
      'Do it',
      'The chancelor of the republic who was the leader of the republic during the clone wars',
      'assets/icons/sithicon.png',
    ),
    Favorito(
      'Emperor Palpatine',
      'Execute Order 66',
      'The emperor of the empire who destroy the separatist and the jedi traitors and is still rulling the galaxy with an iron fist',
      'assets/icons/empireicon.jpeg',
    ),
  ];
  Favorito? _personajeEncontrado;
  String _resultado = '';

  void _buscarPersonaje(String nombre) {
    final encontrado = _favorito.firstWhere(
      (f) => f.nomb.toLowerCase() == nombre.toLowerCase(),
      orElse: () => Favorito('', '', '', ''),
    );

    setState(() {
      _personajeEncontrado = encontrado.nomb.isNotEmpty ? encontrado : null;
      _resultado = encontrado.nomb.isNotEmpty
          ? encontrado.frase
          : 'Personaje no encontrado 😕';
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
          if (_personajeEncontrado != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Pantalla7(
                  nomb: _personajeEncontrado!.nomb,
                  frase: _personajeEncontrado!.frase,
                  description: _personajeEncontrado!.description,
                  faction: _personajeEncontrado!.faction,
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Primero busca un personaje válido'),
              ),
            );
          }
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/wallpaper/r2d2c3.jpg',
                fit: BoxFit.cover,
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Busca a tu personaje favorito',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: _controller,
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Buscar personaje',
                      hintText: 'Ej: Luke Skywalker',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSubmitted: _buscarPersonaje, // cuando presiona Enter
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _buscarPersonaje(_controller.text),
                    child: const Text('Buscar'),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    _resultado,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Favorito {
  final String nomb;
  final String frase;
  final String description;
  final String faction;
  Favorito(this.nomb, this.frase, this.description, this.faction);
}
