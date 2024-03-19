import 'package:developer_company/shared/helpers/extractNumber.dart';

class EmployedCreditRequest {
  int id;
  double commissionRate;
  String employedCode;
  double amount;
  DateTime date;
  DateTime disbursementDate;
  DateTime payPromiseDate;
  double commission;
  double amountToDiscount;
  int idEntity;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  int? updateBy;
  int status;

  EmployedCreditRequest({
    required this.id,
    required this.commissionRate,
    required this.employedCode,
    required this.amount,
    required this.date,
    required this.disbursementDate,
    required this.payPromiseDate,
    required this.commission,
    required this.amountToDiscount,
    required this.idEntity,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.updateBy,
    required this.status,
  });

  factory EmployedCreditRequest.fromJson(Map<String, dynamic> json) {
    return EmployedCreditRequest(
      id: json['Id'],
      commissionRate: json['Tasa_comision'],
      employedCode: json['Codigo_empleado'],
      amount: double.parse(json['Monto'].toString()),
      date: DateTime.parse(json['Fecha']),
      disbursementDate: DateTime.parse(json['Fecha_desembolso']),
      payPromiseDate: DateTime.parse(json['Fecha_pago']),
      commission: double.parse(json['Comision'].toString()),
      amountToDiscount: double.parse(json['Monto_a_descontar'].toString()),
      idEntity: json['Id_entidad'],
      createdAt: DateTime.parse(json['Created_at']),
      updatedAt: DateTime.parse(json['Updated_at']),
      createdBy: json['Createdby'],
      updateBy: json['Updatedby'],
      status: json['Estado'],
    );
  }
  Map<String, String> toMap() {
    return {
      'id': id.toString(),
      'employedCode': employedCode,
      'commissionRate': "$commissionRate %",
      'amount': simpleNumberCurrency(amount.toString()),
      'date': date.toString(),
      'disbursementDate': disbursementDate.toString(),
      'payPromiseDate': payPromiseDate.toString(),
      'commission': simpleNumberCurrency(commission.toString()),
      'amountToDiscount': simpleNumberCurrency(amountToDiscount.toString()),
      'status': status.toString(),
    };
  }
}
