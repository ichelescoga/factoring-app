class ApplicationEvalModel {
  String requestId;
  int noAuthorization;
  String invoiceSerie;
  String invoiceAmount;
  String utilizationPercentage;
  String usageAmount;
  int daysOfUse;
  String interestAmount;

  String commissions;
  String iva;
  String totalDiscount;
  String disbursement;
  String dateDisbursement;
  String paymentDate;
  String availableSpace;
  String overdueBalance;
  String analysis;


  ApplicationEvalModel({
    this.requestId = "",
    required this.noAuthorization,
    required this.invoiceSerie,
    required this.invoiceAmount,
    required this.utilizationPercentage,
    required this.usageAmount,
    required this.daysOfUse,
    required this.interestAmount,

    this.commissions = "",
    this.iva = "",
    this.totalDiscount = "",
    this.disbursement = "",
    this.dateDisbursement = "",
    this.paymentDate = "",
    this.availableSpace = "",
    this.overdueBalance = "",
    this.analysis = "",
  });

  factory ApplicationEvalModel.fromJson(Map<String, dynamic> json) {
    return ApplicationEvalModel(
      requestId: json["Id"].toString(),
      noAuthorization: json['No_Factura'] == null ?  0 : int.tryParse(json['No_Factura'])!,
      invoiceSerie: json['Serie_Factura'] == null ? "" : json['Serie_Factura'],
      invoiceAmount: json['Monto_desembolsar'] == null ? "": json['Monto_desembolsar'].toString(),
      utilizationPercentage: json['Tasa_interes'] == null ? "": json['Tasa_interes'].toString(),
      usageAmount: json['Comision'] == null ? "": json['Comision'].toString(),
      daysOfUse: json['Dias_credito'] == null ? 0: json['Dias_credito'],
      interestAmount: json['Intereses'] == null ? "": json['Intereses'].toString(),
      // commissions: json['commissions'],
      // iva: json['IVA'],
      // totalDiscount: json['total_discount'],
      // disbursement: json['disbursement'],
      // dateDisbursement: json['date_disbursement'],
      // paymentDate: json['payment_date'],
      // availableSpace: json['available_space'],
      // overdueBalance: json['overdue_balance'] ?? '0',
      // analysis: json['analysis'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'No_Authorization': noAuthorization,
      'client': invoiceSerie,
      'invoice_amount': invoiceAmount,
      'utilization_percentage': utilizationPercentage,
      'usage_amount': usageAmount,
      'days_of_use': daysOfUse,
      'interest_amount': interestAmount,
      'commissions': commissions,
      'IVA': iva,
      'total_discount': totalDiscount,
      'disbursement': disbursement,
      'date_disbursement': dateDisbursement,
      'payment_date': paymentDate,
      'available_space': availableSpace,
      'overdue_balance': overdueBalance.toString(),
      'analysis': analysis,
    };
  }
    Map<String, String> toMap() {
    return {
      'No_Authorization': noAuthorization.toString(),
      'client': invoiceSerie,
      'invoice_amount': invoiceAmount,
      'utilization_percentage': utilizationPercentage,
      'usage_amount': usageAmount,
      'days_of_use': daysOfUse.toString(),
      'interest_amount': interestAmount,
      'commissions': commissions,
      'IVA': iva,
      'total_discount': totalDiscount,
      'disbursement': disbursement,
      'date_disbursement': dateDisbursement,
      'payment_date': paymentDate,
      'available_space': availableSpace,
      'overdue_balance': overdueBalance,
      'analysis': analysis,
    };
  }
}
