import 'package:aisu_realestate/models/landlord_model.dart';
import 'package:aisu_realestate/models/property_model.dart';
import 'package:aisu_realestate/models/tenant_model.dart';

class PaymentModel {
  String? id;
  String? invoiceNumber;
  int amount;
  int? amountPaid;
  int? balance;
  String? description;
  String? tenantId;
  String landlordId;
  String propertyId;
  DateTime? date;
  String type;
  String? mode;
  String? reference;
  String? paidBy;
  String? phone;
  bool? isPending;
  final DateTime? created;
  final Expand? expand;

  PaymentModel({
    this.id,
    this.invoiceNumber,
    required this.amount,
    this.amountPaid,
    this.balance,
    this.description,
    this.tenantId,
    required this.landlordId,
    required this.propertyId,
    this.date,
    required this.type,
    this.mode,
    this.reference,
    this.paidBy,
    this.phone,
    this.isPending,
    this.created,
    this.expand,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        id: json["id"],
        invoiceNumber: json["invoice_number"],
        amount: json["amount"],
        amountPaid: json["amount_paid"],
        balance: json["balance"],
        description: json["description"],
        tenantId: json["tenant"],
        landlordId: json["landlord"],
        propertyId: json["property"],
        date: json["date"] == null || json["date"] == ""
            ? null
            : DateTime.parse(json["date"]),
        type: json["type"],
        mode: json["mode"],
        reference: json["reference"],
        paidBy: json["paid_by"],
        phone: json["phone"],
        isPending: json["is_pending"],
        expand: json["expand"] == null ? null : Expand.fromJson(json["expand"]),
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "invoice_number": invoiceNumber,
        "amount": amount,
        "amount_paid": amountPaid,
        "balance": balance,
        "date": date,
        "description": description,
        "tenant": tenantId,
        "landlord": landlordId,
        "property": propertyId,
        "mode": mode,
        "reference": reference,
        "paid_by": paidBy,
        "phone": phone,
        "is_pending": isPending,
        "type": type,
      };
}

class Expand {
  final LandlordModel? landlord;
  final PropertyModel? property;
  final TenantModel? tenant;

  Expand({
    this.landlord,
    this.property,
    this.tenant,
  });

  factory Expand.fromJson(Map<String, dynamic> json) => Expand(
        landlord: json["landlord"] == null
            ? null
            : LandlordModel.fromJson(json["landlord"]),
        property: json["property"] == null
            ? null
            : PropertyModel.fromJson(json["property"]),
        tenant: json["tenant"] == null
            ? null
            : TenantModel.fromJson(json["tenant"]),
      );

  Map<String, dynamic> toJson() => {
        "landlord": landlord?.toJson(),
        "property": property?.toJson(),
        "tenant": tenant?.toJson(),
      };
}
