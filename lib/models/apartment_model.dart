class ApartmentModel {
  String id;
  String name;
  String city;
  String area;
  String street;
  String landlordId;
  String apartmentNumber;

  ApartmentModel({
    required this.id,
    required this.name,
    required this.city,
    required this.area,
    required this.street,
    required this.landlordId,
    required this.apartmentNumber,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
        id: json["_id"],
        name: json["name"],
        city: json["city"],
        area: json["area"],
        street: json["street"],
        landlordId: json["landlord_id"],
        apartmentNumber: json["apartment_number"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "city": city,
        "area": area,
        "street": street,
        "landlord_id": landlordId,
        "apartment_number": apartmentNumber,
      };
}

ApartmentModel defaultApartmentModel = ApartmentModel(
    id: "",
    apartmentNumber: "",
    name: "",
    city: "",
    area: '',
    street: "",
    landlordId: "");
