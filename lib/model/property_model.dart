class PropertyModel {
  String title;
  String subTitle;
  String details;
  String thumbnail;
  List<String> images;
  int rooms;
  int area;
  int floors;
  int price;
  double rating;
  PropertyModel({
    required this.title,
    required this.subTitle,
    required this.details,
    required this.thumbnail,
    required this.images,
    required this.rooms,
    required this.area,
    required this.floors,
    required this.price,
    required this.rating,
  });
}

List<PropertyModel> properties = [
  PropertyModel(
    title: 'ZZ Villa',
    subTitle: "Porto october",
    details:
        'Porto October is located in the heart of 6th of October City, just 5 minutes from Juhayna Square. More than just a place to enjoy living, Porto October offers an upscale lifestyle with international schools, a quiet residential coZZunity, administrative offices, an international medical center and a 5-star hotel. Its the place for everything you need and more',
    thumbnail: 'images/properties/villa2.jpeg',
    images: [
      'images/properties/villa1.jpeg',
      'images/properties/villa2.jpeg',
      'images/properties/villa3.jpeg'
    ],
    rooms: 5,
    area: 3000,
    floors: 3,
    price: 3000,
    rating: 4.3,
  ),
  PropertyModel(
    title: 'ZZ Duplex ',
    subTitle: "PYRAMIDS HILLS, CAIRO ALEXANDRIA DESERT ROAD",
    details:
        'Pyramid Hills is located conveniently between central Cairo and western Cairo (Giza). The compound’s incredible location provides it with a spectacular view of the Pyramids of Giza, while also providing its residents with a very close proximity to the downtown core and the Sheikh Zayed area. Phase One featured 93, semi-finished villas , twin & town-houses. Phase Two, with only some remaining availabilities, features 376 fully finished apartments and 62 semi-finished twin & town houses and an extension - Pyramid Hills West Gate - which features another 20 twin & town houses ..',
    thumbnail: 'images/properties/ap4.jpeg',
    images: [
      'images/properties/ap2.jpeg',
      'images/properties/ap7.jpeg',
      'images/properties/ap6.jpeg'
    ],
    rooms: 3,
    area: 3500,
    floors: 2,
    price: 5000,
    rating: 4.7,
  ),
  PropertyModel(
    title: 'ZZ House',
    subTitle: "Mountain View iCity October",
    details:
        'It is located a short distance from the famous Mall of Arabia, estimated at about five minutes, no more.It is located behind the shooting club.Mountain View October is located ten minutes from Dar Al Fouad Hospital and Nile National University.The distance between it and Juhayna Mall does not exceed four minutes only.',
    thumbnail: 'images/properties/ap6.jpeg',
    images: [
      'images/properties/ap4.jpeg',
      'images/properties/ap5.jpeg',
      'images/properties/ap6.jpeg'
    ],
    rooms: 4,
    area: 4200,
    floors: 3,
    price: 6000,
    rating: 4.8,
  ),
];
