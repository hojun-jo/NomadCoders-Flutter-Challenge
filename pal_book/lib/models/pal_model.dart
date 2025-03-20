import 'package:pal_book/models/pal_elements.dart';

class PalModel {
  final String id;
  final String name;
  final PalElements elements;
  final String summary;
  final String description;

  PalModel({
    required this.id,
    required this.name,
    required this.elements,
    required this.summary,
    required this.description,
  });

  factory PalModel.fromJson(Map<String, dynamic> json) => PalModel(
    id: json["id"],
    name: json["name"],
    elements: PalElements.fromString(json["elements"]),
    summary: json["summary"],
    description: json["description"],
  );
}
