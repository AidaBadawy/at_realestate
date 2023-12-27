import 'package:aisu_realestate/models/tenant_model.dart';

class PropertyModel {
  String id;
  String propertyNumber;
  String floor;
  String flat;
  int room;
  int bath;
  String description;
  String landlordId;
  String? tenantId;
  String apartmentId;
  int monthlyRent;
  int deposit;
  DateTime? nextPayment;
  TenantModel? tenantModel;

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
    this.tenantId,
    required this.monthlyRent,
    required this.deposit,
    this.nextPayment,
    this.tenantModel,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
      id: json["id"],
      propertyNumber: json["property_number"],
      floor: json["floor"],
      flat: json["flat"],
      room: json["room"],
      bath: json["bath"],
      description: json["description"],
      landlordId: json["landlord_id"],
      apartmentId: json["apartment_id"],
      tenantId: json["tenant"],
      monthlyRent: json["monthly_rent"],
      deposit: json["deposit"],
      nextPayment: json["next_payment"] == ""
          ? null
          : DateTime.parse(json["next_payment"]),
      tenantModel: json["expand"]["tenant"] == null
          ? null
          : TenantModel.fromJson(json["expand"]["tenant"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "property_number": propertyNumber,
        "floor": floor,
        "flat": flat,
        "room": room,
        "bath": bath,
        "description": description,
        "landlord_id": landlordId,
        "apartment_id": apartmentId,
        "tenant": tenantId,
        "monthly_rent": monthlyRent,
        "deposit": deposit,
        "next_payment": nextPayment,
      };
}

PropertyModel defaultProperty = PropertyModel(
  id: "",
  propertyNumber: "",
  floor: "",
  flat: "",
  room: 0,
  bath: 0,
  description: "",
  landlordId: "",
  apartmentId: "",
  monthlyRent: 0,
  deposit: 1,
  nextPayment: DateTime.now(),
);
