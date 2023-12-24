import 'package:aisu_realestate/models/landlord_model.dart';
import 'package:aisu_realestate/models/property_model.dart';

class TenantModel {
  final int? balancePayment;
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  final String? email;
  final TenantModelExpand? expand;
  final String? id;
  final String? idNumber;
  final String? landlord;
  final DateTime? lastPayment;
  final String? name;
  final int? pendingPayment;
  final String? phone;
  final String? property;
  final String? tenantNumber;
  final DateTime? updated;

  TenantModel({
    this.balancePayment,
    this.collectionId,
    this.collectionName,
    this.created,
    this.email,
    this.expand,
    this.id,
    this.idNumber,
    this.landlord,
    this.lastPayment,
    this.name,
    this.pendingPayment,
    this.phone,
    this.property,
    this.tenantNumber,
    this.updated,
  });

  factory TenantModel.fromJson(Map<String, dynamic> json) => TenantModel(
        balancePayment: json["balance_payment"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        email: json["email"],
        expand: json["expand"] == null
            ? null
            : TenantModelExpand.fromJson(json["expand"]),
        id: json["id"],
        idNumber: json["id_number"],
        landlord: json["landlord"],
        lastPayment: json["last_payment"] == null
            ? null
            : DateTime.parse(json["last_payment"]),
        name: json["name"],
        pendingPayment: json["pending_payment"],
        phone: json["phone"],
        property: json["property"],
        tenantNumber: json["tenant_number"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "balance_payment": balancePayment,
        // "collectionId": collectionId,
        // "collectionName": collectionName,
        // "created": created?.toIso8601String(),
        "email": email,
        // "expand": expand?.toJson(),
        "id": id,
        "id_number": idNumber,
        "landlord": landlord,
        "last_payment": lastPayment?.toIso8601String(),
        "name": name,
        "pending_payment": pendingPayment,
        "phone": phone,
        "property": property,
        "tenant_number": tenantNumber,
        // "updated": updated?.toIso8601String(),
      };
}

class TenantModelExpand {
  final LandlordModel? landlord;
  final PropertyModel? property;

  TenantModelExpand({
    this.landlord,
    this.property,
  });

  factory TenantModelExpand.fromJson(Map<String, dynamic> json) =>
      TenantModelExpand(
        landlord: json["landlord"] == null
            ? null
            : LandlordModel.fromJson(json["landlord"]),
        property: json["property"] == null
            ? null
            : PropertyModel.fromJson(json["property"]),
      );

  Map<String, dynamic> toJson() => {
        "landlord": landlord?.toJson(),
        "property": property?.toJson(),
      };
}
