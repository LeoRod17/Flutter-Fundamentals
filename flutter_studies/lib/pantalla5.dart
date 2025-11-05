import 'package:flutter/material.dart';
import 'pantalla6.dart';

class Pantalla5 extends StatefulWidget {
  const Pantalla5({super.key});

  @override
  State<Pantalla5> createState() => _Pantalla5State();
}

class _Pantalla5State extends State<Pantalla5> {
  bool _lightside = false;
  bool _darkside = false;

  String get _avatarImage {
    if (_lightside) {
      return 'assets/icons/bluesabericon.jpg';
    } else if (_darkside) {
      return 'assets/icons/vaderSaber.jpg';
    } else {
      return 'assets/icons/EmptySaberIcon.png';
    }
  }

  String get _wallImage {
    if (_lightside) {
      return 'assets/wallpaper/anakinclonewarslight.jpg';
    } else if (_darkside) {
      return 'assets/wallpaper/vader.jpg';
    } else {
      return 'assets/wallpaper/lightvsdark.jpg';
    }
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
            MaterialPageRoute(builder: (context) => const Pantalla6()),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: Image.asset(_wallImage, fit: BoxFit.cover)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose between the dark or the light',
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Choose the Light',
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch(
                    value: _lightside,
                    onChanged: (bool newValue) {
                      setState(() {
                        _lightside = newValue;
                      });
                    },
                  ),
                  Text(
                    'Choose the Darkside',
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch(
                    value: _darkside,
                    onChanged: (bool newValue) {
                      setState(() {
                        _darkside = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(_avatarImage),
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
