import 'package:http/http.dart' as http;
import 'dart:convert';

class Starship {
  final String name;
  final String model;
  final String manufacturer;
  final String cost_in_credits;
  final String length;
  final String max_atmosphering_speed;
  final String crew;
  final String passengers;
  final String cargo_capacity;
  final String consumables;
  final String hyperdrive_rating;
  final String MGLT;
  final String starship_class;

  const Starship({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.cost_in_credits,
    required this.length,
    required this.max_atmosphering_speed,
    required this.crew,
    required this.passengers,
    required this.cargo_capacity,
    required this.consumables,
    required this.hyperdrive_rating,
    required this.MGLT,
    required this.starship_class,
  });

  factory Starship.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'model': String model,
        'manufacturer': String manufacturer,
        'cost_in_credits': String cost_in_credits,
        'length': String length,
        'max_atmosphering_speed': String max_atmosphering_speed,
        'crew': String crew,
        'passengers': String passengers,
        'cargo_capacity': String cargo_capacity,
        'consumables': String consumables,
        'hyperdrive_rating': String hyperdrive_rating,
        'MGLT': String MGLT,
        'starship_class': String starship_class,
      } =>
        Starship(
          name: name,
          model: model,
          manufacturer: manufacturer,
          cost_in_credits: cost_in_credits,
          length: length,
          max_atmosphering_speed: max_atmosphering_speed,
          crew: crew,
          passengers: passengers,
          cargo_capacity: cargo_capacity,
          consumables: consumables,
          hyperdrive_rating: hyperdrive_rating,
          MGLT: MGLT,
          starship_class: starship_class,
        ),
      _ => throw const FormatException(
        'Failed to access the starships database.',
      ),
    };
  }
}

Future<List<Starship>> fetchStarships() async {
  final response = await http.get(
    Uri.parse('https://swapi.dev/api/starships/'),
  );

  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final results = decoded['results'] as List<dynamic>;

    return results.map((json) => Starship.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load starships');
  }
}
