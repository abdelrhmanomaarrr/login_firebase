class CategoryModel {
  String title;
  String assetPath;
  CategoryModel({
    required this.title,
    required this.assetPath,
  });
}

List<CategoryModel> categories = [
  CategoryModel(title: 'Villas', assetPath: 'resort.jpeg'),
  CategoryModel(title: 'Apartments', assetPath: 'cottage.jpeg'),
  CategoryModel(title: 'Offices', assetPath: 'office.jpeg'),
  CategoryModel(title: 'Building', assetPath: 'urban.jpeg'),
];
