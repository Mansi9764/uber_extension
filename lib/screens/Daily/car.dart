class Car {
  final String name;         // Name of the car
  final String description;  // Description of the car
  final double price;        // Price per day
  final double rating;       // Rating out of 5
  final String imagePath;    // Path to the image asset

  Car({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imagePath,
  });
}
