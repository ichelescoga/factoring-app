class AcceptRejectRequestModel {
  int idRequest;
  String authorization;
  String client;
  String disbursement;

  AcceptRejectRequestModel({
    required this.idRequest,
    required this.authorization,
    required this.client,
    required this.disbursement,
  });

  Map<String, dynamic> toJson() {
    return {
      "idRequest": idRequest,
      "authorization": authorization,
      "client": client,
      "disbursement": disbursement
    };
  }

  factory AcceptRejectRequestModel.fromJson(Map json) {
    return AcceptRejectRequestModel(
        idRequest: int.tryParse(json['idRequest']) ?? 0,
        authorization: json['authorization'] ?? '',
        client: json['client'] ?? '',
        disbursement: json['disbursement'] ?? '');
  }
  factory AcceptRejectRequestModel.emptyInit() {
    return AcceptRejectRequestModel(
        idRequest: 0, authorization: '', client: '', disbursement: '');
  }
}
