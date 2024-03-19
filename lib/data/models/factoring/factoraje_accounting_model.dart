import 'package:developer_company/utils/factoring/application_statuses.dart';

class AccountingModel {
  int noAuthorization;
  String client;
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
  String approved;
  String finalDisbursement;

  AccountingModel({
    required this.noAuthorization,
    required this.client,
    required this.invoiceAmount,
    required this.utilizationPercentage,
    required this.usageAmount,
    required this.daysOfUse,
    required this.interestAmount,
    required this.commissions,
    required this.iva,
    required this.totalDiscount,
    required this.disbursement,
    required this.dateDisbursement,
    required this.paymentDate,
    required this.availableSpace,
    required this.overdueBalance,
    required this.analysis,
    required this.approved,
    required this.finalDisbursement,
  });

  factory AccountingModel.fromJson(Map<String, dynamic> json) {
    return AccountingModel(
        noAuthorization: json['No_Authorization'],
        client: json['client'],
        invoiceAmount: json['invoice_amount'],
        utilizationPercentage: json['utilization_percentage'],
        usageAmount: json['usage_amount'],
        daysOfUse: json['days_of_use'],
        interestAmount: json['interest_amount'],
        commissions: json['commissions'],
        iva: json['IVA'],
        totalDiscount: json['total_discount'],
        disbursement: json['disbursement'],
        dateDisbursement: json['date_disbursement'],
        paymentDate: json['payment_date'],
        availableSpace: json['available_space'],
        overdueBalance: json['overdue_balance'] ?? '0',
        analysis: json['analysis'] ?? '',
        approved: json['approved'] ?? "",
        finalDisbursement: json['finalDisbursement'] ?? '');
  }

  factory AccountingModel.fromJsonV2(Map<String, dynamic> json) {
    return AccountingModel(
      noAuthorization:
          json['No_Factura'] == null ? 0 : int.tryParse(json['No_Factura'])!,
      client: json['Empresa'] ?? "",
      invoiceAmount: json['Monto_factura'] == null
          ? "0"
          : json['Monto_factura'].toString(),
      utilizationPercentage:
          json['Intereses'] == null ? "0" : json['Intereses'].toString(),
      usageAmount: json['Monto_desembolsar'] == null
          ? "0"
          : json['Monto_desembolsar'].toString(),
      daysOfUse: json['Dias_credito'] == null ? 0 : json['Dias_credito'],
      interestAmount:
          json['Intereses'] == null ? "0" : json['Intereses'].toString(),
      commissions: json['Comision'] == null ? "0" : json['Comision'].toString(),
      iva: '0', //TODO PENDING OF SERVICE
      totalDiscount: '0', //TODO PENDING OF SERVICE
      disbursement: json['Monto_solicitado'] == null
          ? "0"
          : json['Monto_solicitado'].toString(),
      dateDisbursement: json['Fecha_desembolso'] ?? "",
      paymentDate: json['Fecha_pago'] ?? "",
      availableSpace: '0', //TODO PENDING OF SERVICE
      overdueBalance: '0', //TODO PENDING OF SERVICE
      analysis: '', //TODO PENDING OF SERVICE
      approved: applicationStatuses(json['Estado']),
      finalDisbursement: json['Monto_desembolsar'] == null
          ? ""
          : json['Monto_desembolsar'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'No_Authorization': noAuthorization,
      'client': client,
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
      'approved': approved,
      'finalDisbursement': finalDisbursement
    };
  }

  Map<String, String> toMap() {
    return {
      'No_Authorization': noAuthorization.toString(),
      'client': client,
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
      'approved': approved,
      'finalDisbursement': finalDisbursement
    };
  }
}
