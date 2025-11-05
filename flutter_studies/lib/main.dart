import 'package:flutter/material.dart';
import 'pantalla2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Stack(
          children: [
            const Columna(),
            const Siguiente(),
            const Align(alignment: Alignment.topCenter, child: BarraInicio()),
          ],
        ),
      ),
    );
  }
}

class BarraInicio extends StatelessWidget {
  const BarraInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(backgroundColor: Colors.red, radius: 15),
            const Text(
              'Bienvenidos a mi app de flutter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigoAccent,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Columna extends StatelessWidget {
  const Columna({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/wallpaper/WallpaperSun.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "este es un projecto de practica para aprender flutter",
              style: TextStyle(color: Colors.lightBlue, fontSize: 30),
            ),
          ],
        ),
      ],
    );
  }
}

class Siguiente extends StatelessWidget {
  const Siguiente({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Detectar deslizamiento horizontal
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          // 👈 Deslizó hacia la izquierda
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Pantalla2()),
          );
        }
      },
      // Detectar un simple "tap" (clic)
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Pantalla2()),
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            const Columna(),
            const Align(alignment: Alignment.topCenter, child: BarraInicio()),
            // Podés eliminar el Bottonsiguiente si usás este gesto
          ],
        ),
      ),
    );
  }
}
