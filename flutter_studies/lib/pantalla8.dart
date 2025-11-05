import 'package:flutter/material.dart';
import 'independent/starwarsapiship.dart';
import 'pantalla9.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => Pantalla8();
}

class Pantalla8 extends State<MyApp> {
  late Future<List<Starship>> futureShips;

  @override
  void initState() {
    super.initState();
    futureShips = fetchStarships();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars Starships',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (details) {
          final anchoPantalla = MediaQuery.of(context).size.width;
          final posicionX = details.localPosition.dx;

          if (posicionX < anchoPantalla / 2) {
            Navigator.pop(context);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Pantalla9()),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Star Wars Starships')),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wallpaper/Xwingwallpaper.webp'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.6), // capa semitransparente
              child: Center(
                child: FutureBuilder<List<Starship>>(
                  future: futureShips,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final ships = snapshot.data!;
                      return ListView.builder(
                        itemCount: ships.length,
                        itemBuilder: (context, index) {
                          final ship = ships[index];
                          return Card(
                            color: Colors.black.withOpacity(0.5),
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: Image.asset(
                                'assets/icons/tiefightericon.jpg',
                                width: 40,
                                height: 40,
                              ),
                              title: Text(
                                ship.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Modelo: ${ship.model}',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Text(
                                    'Fabricante: ${ship.manufacturer}',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(color: Colors.white),
                      );
                    }
                    return const CircularProgressIndicator(color: Colors.white);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
