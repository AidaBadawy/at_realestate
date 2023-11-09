class AppIdModel {
  String landlordNumber;
  String tenantNumber;
  String apartmentNumber;
  String propertyNumber;
  String invoiceNumber;
  String id;

  AppIdModel({
    required this.landlordNumber,
    required this.tenantNumber,
    required this.apartmentNumber,
    required this.propertyNumber,
    required this.invoiceNumber,
    required this.id,
  });

  factory AppIdModel.fromJson(Map<String, dynamic> json) => AppIdModel(
        landlordNumber: json["landlord_number"],
        tenantNumber: json["tenant_number"],
        apartmentNumber: json["apartment_number"],
        propertyNumber: json["property_number"],
        invoiceNumber: json["invoice_number"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "landlord_number": landlordNumber,
        "tenant_number": tenantNumber,
        "apartment_number": apartmentNumber,
        "property_number": propertyNumber,
        "invoice_number": invoiceNumber,
        "_id": id,
      };
}

AppIdModel defaultAppIdModel = AppIdModel(
  landlordNumber: "",
  tenantNumber: "",
  apartmentNumber: "",
  propertyNumber: "",
  invoiceNumber: "",
  id: "",
);
