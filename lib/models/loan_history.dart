class LoanHistoryModel {
  LoanHistoryModel.initial()
      : id = '0',
        active = false,
        createdAt = '';
  LoanHistoryModel({
    required this.id,
    required this.userId,
    required this.loanId,
    required this.loanAmount,
    required this.amountRepaid,
    required this.amountLeft,
    required this.paymentPerMonth,
    required this.duration,
    required this.durationSpent,
    required this.durationLeft,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String userId;
  late final String loanId;
  late final String loanAmount;
  late final String amountRepaid;
  late final String amountLeft;
  late final String paymentPerMonth;
  late final String duration;
  late final String durationSpent;
  late final String durationLeft;
  late final bool active;
  late final String createdAt;
  late final String updatedAt;

  LoanHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    loanId = json['loan_id'];
    loanAmount = json['payment_amount'];
    amountRepaid = json['amount_repaid'];
    amountLeft = json['amount_left'];
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['loan_id'] = loanId;
    _data['payment_amount'] = loanAmount;
    _data['amount_repaid'] = amountRepaid;
    _data['amount_left'] = amountLeft;
    _data['payment_per_month'] = paymentPerMonth;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
