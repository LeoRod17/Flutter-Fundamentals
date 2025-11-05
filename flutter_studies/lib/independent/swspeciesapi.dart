import 'package:http/http.dart' as http;
import 'dart:convert';

class Species {
  final String name;
  final String classification;
  final String designation;
  final String average_height;
  final String skin_colors;
  final String hair_colors;
  final String eye_colors;
  final String average_lifespan;
  final String homeworld;
  final String language;

  const Species({
    required this.name,
    required this.classification,
    required this.designation,
    required this.average_height,
    required this.skin_colors,
    required this.hair_colors,
    required this.eye_colors,
    required this.average_lifespan,
    required this.homeworld,
    required this.language,
  });

  factory Species.fromJson(Map<String, dynamic> json) {
    try {
      return Species(
        name: json['name'] as String? ?? 'Unknown',
        classification: json['classification'] as String? ?? 'Unknown',
        designation: json['designation'] as String? ?? 'Unknown',
        average_height: json['average_height'] as String? ?? 'Unknown',
        skin_colors: json['skin_colors'] as String? ?? 'Unknown',
        hair_colors: json['hair_colors'] as String? ?? 'Unknown',
        eye_colors: json['eye_colors'] as String? ?? 'Unknown',
        average_lifespan: json['average_lifespan'] as String? ?? 'Unknown',
        homeworld: json['homeworld'] as String? ?? 'Unknown',
        language: json['language'] as String? ?? 'Unknown',
      );
    } catch (e) {
      throw FormatException('Error parsing Species JSON: $e');
    }
  }
}

Future<List<Species>> fetchSpecies() async {
  final response = await http.get(Uri.parse('https://swapi.dev/api/species/'));

  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final results = decoded['results'] as List<dynamic>;

    return results.map((json) => Species.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load the alien species');
  }
}
