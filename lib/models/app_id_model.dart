// class AppIdModel {
//   String landlordNumber;
//   String tenantNumber;
//   String apartmentNumber;
//   String propertyNumber;
//   String invoiceNumber;
//   String id;

//   AppIdModel({
//     required this.landlordNumber,
//     required this.tenantNumber,
//     required this.apartmentNumber,
//     required this.propertyNumber,
//     required this.invoiceNumber,
//     required this.id,
//   });

//   factory AppIdModel.fromJson(Map<String, dynamic> json) => AppIdModel(
//         landlordNumber: json["landlord_number"],
//         tenantNumber: json["tenant_number"],
//         apartmentNumber: json["apartment_number"],
//         propertyNumber: json["property_number"],
//         invoiceNumber: json["invoice_number"],
//         id: json["_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "landlord_number": landlordNumber,
//         "tenant_number": tenantNumber,
//         "apartment_number": apartmentNumber,
//         "property_number": propertyNumber,
//         "invoice_number": invoiceNumber,
//         "_id": id,
//       };
// }

// AppIdModel defaultAppIdModel = AppIdModel(
//   landlordNumber: "",
//   tenantNumber: "",
//   apartmentNumber: "",
//   propertyNumber: "",
//   invoiceNumber: "",
//   id: "",
// );

// To parse this JSON data, do
//
//     final incrementModel = incrementModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final incrementModel = incrementModelFromJson(jsonString);

class IncrementModel {
  String? apartmentNumber;
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  final String? id;
  final String? invoiceNumber;
  String? landlordNumber;
  String? propertyNumber;
  String? tenantNumber;
  final DateTime? updated;

  IncrementModel({
    this.apartmentNumber,
    this.collectionId,
    this.collectionName,
    this.created,
    this.id,
    this.invoiceNumber,
    this.landlordNumber,
    this.propertyNumber,
    this.tenantNumber,
    this.updated,
  });

  factory IncrementModel.fromJson(Map<String, dynamic> json) => IncrementModel(
        apartmentNumber: json["apartment_number"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        id: json["id"],
        invoiceNumber: json["invoice_number"],
        landlordNumber: json["landlord_number"],
        propertyNumber: json["property_number"],
        tenantNumber: json["tenant_number"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "apartment_number": apartmentNumber,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created?.toIso8601String(),
        "id": id,
        "invoice_number": invoiceNumber,
        "landlord_number": landlordNumber,
        "property_number": propertyNumber,
        "tenant_number": tenantNumber,
        "updated": updated?.toIso8601String(),
      };
}

IncrementModel defaultIncrement = IncrementModel();
