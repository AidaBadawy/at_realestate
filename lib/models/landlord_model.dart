class LandlordModel {
  String id;
  String landlordNumber;
  String name;
  String phone;
  String email;
  String idNumber;
  List<String>? documents;

  LandlordModel({
    required this.id,
    required this.landlordNumber,
    required this.name,
    required this.phone,
    required this.email,
    required this.idNumber,
    this.documents,
  });

  factory LandlordModel.fromJson(Map<String, dynamic> json) => LandlordModel(
        id: json["_id"],
        landlordNumber: json["landlord_number"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        idNumber: json["id_number"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "id_number": idNumber,
        "landlord_number": landlordNumber,
      };
}

LandlordModel defaultLanlord = LandlordModel(
    id: "", landlordNumber: "", name: "", phone: "", email: "", idNumber: "");
