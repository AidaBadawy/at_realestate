class PaymentModel {
  String id;
  String? invoiceNumber;
  int amount;
  int? amountPaid;
  int? balance;
  String? description;
  String? tenantId;
  String? tenantName;
  String landlordId;
  String apartmentId;
  String propertyId;
  DateTime? date;
  String type;
  String? mode;
  String? reference;
  String? paidBy;
  String? mobile;

  PaymentModel({
    required this.id,
    this.invoiceNumber,
    required this.amount,
    this.amountPaid,
    this.balance,
    this.description,
    this.tenantId,
    this.tenantName,
    required this.landlordId,
    required this.apartmentId,
    required this.propertyId,
    this.date,
    required this.type,
    this.mode,
    this.reference,
    this.paidBy,
    this.mobile,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        id: json["_id"],
        invoiceNumber: json["invoice_number"],
        amount: json["amount"],
        amountPaid: json["amount_paid"],
        balance: json["balance"],
        description: json["description"],
        tenantId: json["tenant_id"],
        tenantName: json["tenant_name"],
        landlordId: json["landlord_id"],
        apartmentId: json["apartment_id"],
        propertyId: json["property_id"],
        date: json["date"],
        type: json["type"],
        mode: json["mode"],
        reference: json["reference"],
        paidBy: json["paid_by"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "invoice_number": invoiceNumber,
        "amount": amount,
        "amount_paid": amountPaid,
        "balance": balance,
        "description": description,
        "tenant_id": tenantId,
        "tenant_name": tenantName,
        "landlord_id": landlordId,
        "apartment_id": apartmentId,
        "property_id": propertyId,
        "date": date,
        "type": type,
        "mode": mode,
        "reference": reference,
        "paid_by": paidBy,
        "mobile": mobile,
      };
}

// PaymentModel defaultLanlord = PaymentModel(
//     id: "", invoiceNumber: "", amount: "", description: "", tenantId: "", date: "");
