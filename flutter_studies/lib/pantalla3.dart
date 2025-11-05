import 'package:flutter/material.dart';
import 'pantalla4.dart';
import 'independent/profilecard.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});
  profileCard() {}
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
            MaterialPageRoute(builder: (context) => const Pantalla4()),
          );
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/wallpaper/darthvader.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: const [
              ProfileCard(
                name: "Luke Skywalker",
                descripcion:
                    "The grand master of the new jedi order and the most powerfull jedi to ever lived (my favorite character))",
                imageUrl: "jediicon.jpg",
              ),
              SizedBox(height: 20),
              ProfileCard(
                name: "Han Solo",
                descripcion:
                    "The most famous scoundrel in the galaxy of his era and the only person who would let an imperial oficer gave them a surname",
                imageUrl: "outlawicon.jpg",
              ),
              SizedBox(height: 20),
              ProfileCard(
                name: "Darth Vader",
                descripcion:
                    "The most frightening figure of the empire surrounded by mistery and darkness if you see him you run",
                imageUrl: "empireicon.jpeg",
              ),
              SizedBox(height: 20),
              ProfileCard(
                name: "Obi Wan Kenobi",
                descripcion:
                    "One of the few jedi to survive order 66 former member of the high jedi council, known as the negotiator while beeing a general in the clone wars also known for being the master of the chosen one",
                imageUrl: "jediicon.jpg",
              ),
              SizedBox(height: 20),
              ProfileCard(
                name: "Darth Revan",
                descripcion:
                    "A member of the jedi order in the era of the old republic during the mandalorian wars leader of the war between the mandalorians and the republic after the war he return with an army and had joined the sith order",
                imageUrl: "sithicon.png",
              ),
              SizedBox(height: 20),
              ProfileCard(
                name: "Princess Leia Organa",
                descripcion:
                    "A princess from the planet alderan who joined the rebelion to restore the republic and fight agains the empire",
                imageUrl: "Rebelicon.webp",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
