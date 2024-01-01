import 'package:aisu_realestate/models/landlord_model.dart';
import 'package:aisu_realestate/models/property_model.dart';

class TenantModel {
  int? balancePayment;
  int? rentPayment;
  int? deposit;
  bool? depositPaid;
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  String? email;
  final TenantModelExpand? expand;
  String? id;
  String? idNumber;
  final String? landlord;
  DateTime? lastPayment;
  String? name;
  final int? pendingPayment;
  String? phone;
  final String? property;
  String? tenantNumber;
  String? apartment;
  final DateTime? updated;

  TenantModel({
    this.balancePayment,
    this.rentPayment,
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
    this.deposit,
    this.depositPaid,
    this.apartment,
  });

  factory TenantModel.fromJson(Map<String, dynamic> json) => TenantModel(
        balancePayment: json["balance_payment"],
        rentPayment: json["rent_payment"],
        deposit: json["deposit"],
        depositPaid: json["deposit_paid"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: json["created"] == null || json["created"] == ""
            ? null
            : DateTime.parse(json["created"]),
        email: json["email"],
        expand: json["expand"] == null
            ? null
            : TenantModelExpand.fromJson(json["expand"]),
        id: json["id"],
        idNumber: json["id_number"],
        landlord: json["landlord"],
        lastPayment: json["last_payment"] == null || json["last_payment"] == ""
            ? null
            : DateTime.parse(json["last_payment"]),
        name: json["name"],
        pendingPayment: json["pending_payment"],
        phone: json["phone"],
        property: json["property"],
        tenantNumber: json["tenant_number"],
        apartment: json["apartment"],
        updated: json["updated"] == null || json["updated"] == ""
            ? null
            : DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "balance_payment": balancePayment,
        "rent_payment": rentPayment,
        "deposit": deposit,
        "deposit_paid": depositPaid,
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
