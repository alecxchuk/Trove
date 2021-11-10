class UserPortfolio {
  String? id;
  String? userId;
  String? symbol;
  String? totalQuantity;
  String? equityValue;
  String? createdAt;
  Null? updatedAt;
  Null? deletedAt;

  UserPortfolio(
      {this.id,
      this.userId,
      this.symbol,
      this.totalQuantity,
      this.equityValue,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  UserPortfolio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    symbol = json['symbol'];
    totalQuantity = json['total_quantity'];
    equityValue = json['equity_value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['symbol'] = symbol;
    data['total_quantity'] = totalQuantity;
    data['equity_value'] = equityValue;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
