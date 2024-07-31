class Category {
  final int id;
  final String name;

  Category(
      {required this.id,
      required this.name,
      });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json.containsKey('id') ? json['id'] as int? ?? 0 : 0,
      name: json.containsKey('name')
          ? json['name'] as String? ?? 'unknown category'
          : 'unknown category',
    );
  }
}
