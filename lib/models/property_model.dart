class PropertyModel {
  String id;
  String propertyNumber;
  String floor;
  String flat;
  String room;
  String bath;
  String description;
  String landlordId;
  String apartmentId;
  int monthlyRent;
  int deposit;

  PropertyModel({
    required this.id,
    required this.propertyNumber,
    required this.floor,
    required this.flat,
    required this.room,
    required this.bath,
    required this.description,
    required this.landlordId,
    required this.apartmentId,
    required this.monthlyRent,
    required this.deposit,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        id: json["_id"],
        propertyNumber: json["property_number"],
        floor: json["floor"],
        flat: json["flat"],
        room: json["room"],
        bath: json["bath"],
        description: json["description"],
        landlordId: json["landlord_id"],
        apartmentId: json["apartment_id"],
        monthlyRent: json["monthly_rent"],
        deposit: json["deposit"],
      );

  Map<String, dynamic> toJson() => {
        "property_number": propertyNumber,
        "floor": floor,
        "flat": flat,
        "room": room,
        "bath": bath,
        "description": description,
        "landlord_id": landlordId,
        "apartment_id": apartmentId,
        "monthly_rent": monthlyRent,
        "deposit": deposit,
      };
}

PropertyModel defaultProperty = PropertyModel(
    id: "",
    propertyNumber: "",
    floor: "",
    flat: "",
    room: "",
    bath: "",
    description: "",
    landlordId: "",
    apartmentId: "",
    monthlyRent: 0,
    deposit: 1);
