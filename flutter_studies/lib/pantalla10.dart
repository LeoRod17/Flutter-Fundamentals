import 'package:flutter/material.dart';
import 'independent/swspeciesapi.dart';
import 'pantalla11.dart';

class Pantalla10 extends StatefulWidget {
  const Pantalla10({super.key});

  @override
  State<Pantalla10> createState() => Pantalla010();
}

class Pantalla010 extends State<Pantalla10> {
  bool _lightside = false;
  late Future<List<Species>> futureSpecies;

  @override
  void initState() {
    super.initState();
    futureSpecies = fetchSpecies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars Alien Species',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
      ),
      home: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (details) {
          final anchoPantalla = MediaQuery.of(context).size.width;
          final posicionX = details.localPosition.dx;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Star Wars Species'),
            backgroundColor: _lightside
                ? const Color.fromARGB(255, 112, 44, 40)
                : Colors.teal,
            foregroundColor: Colors.white,
          ),
          body: Container(
            decoration: const BoxDecoration(color: Colors.blueGrey),
            child: Container(
              color: Colors.black.withOpacity(0.6),
              child: Center(
                child: FutureBuilder<List<Species>>(
                  future: futureSpecies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final species = snapshot.data!;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Light Side',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                                Switch(
                                  value: _lightside,
                                  onChanged: (value) {
                                    setState(() {
                                      _lightside = value;
                                    });
                                  },
                                  activeColor: Colors.redAccent,
                                ),
                                const Text(
                                  'Dark Side',
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: species.length,
                              itemBuilder: (context, index) {
                                final specie = species[index];
                                return Card(
                                  color: _lightside
                                      ? const Color.fromARGB(255, 112, 44, 40)
                                      : Colors.teal,
                                  margin: const EdgeInsets.all(10),
                                  child: ListTile(
                                    title: Text(
                                      specie.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Classification: ${specie.classification}',
                                          style: const TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                        Text(
                                          'Designation: ${specie.designation}',
                                          style: const TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PantallaDetalles(specie: specie),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
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
