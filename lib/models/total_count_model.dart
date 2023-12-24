class TotalCount {
  final int apartmentCount;
  final String collectionId;
  final String collectionName;
  final String id;
  final int landlordCount;
  final int propertyCount;
  final int tenantCount;
  final int vacantCount;

  TotalCount({
    required this.apartmentCount,
    required this.collectionId,
    required this.collectionName,
    required this.id,
    required this.landlordCount,
    required this.propertyCount,
    required this.tenantCount,
    required this.vacantCount,
  });

  factory TotalCount.fromJson(Map<String, dynamic> json) => TotalCount(
        apartmentCount: json["apartment_count"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        id: json["id"],
        landlordCount: json["landlord_count"],
        propertyCount: json["property_count"],
        tenantCount: json["tenant_count"],
        vacantCount: json["vacant_count"],
      );

  Map<String, dynamic> toJson() => {
        "apartment_count": apartmentCount,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "id": id,
        "landlord_count": landlordCount,
        "property_count": propertyCount,
        "tenant_count": tenantCount,
        "vacant_count": vacantCount,
      };
}

TotalCount defaultTotalCount = TotalCount(
    apartmentCount: 0,
    collectionId: "",
    collectionName: "",
    id: "",
    landlordCount: 0,
    propertyCount: 0,
    tenantCount: 0,
    vacantCount: 0);
