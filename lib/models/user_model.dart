class User {
  String? id;
  String? firstName;
  String? lastName;
  String? phonenumber;
  String? email;
  String? password;
  String? bankName;
  String? bankAccountNumber;
  String? bankUsername;
  String? portfolioValue;
  String? dateOfBirth;
  bool? verified;
  String? createdAt;
  String? updatedAt;
  String? loggedAt;
  String? deletedAt;

  User.initial()
      : id = '0',
        firstName = '',
        lastName = '';

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.phonenumber,
      this.email,
      this.password,
      this.bankName,
      this.bankAccountNumber,
      this.bankUsername,
      this.portfolioValue,
      this.dateOfBirth,
      this.verified,
      this.createdAt,
      this.updatedAt,
      this.loggedAt,
      this.deletedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id!,
      'firstName': firstName!,
      'lastName': lastName!,
      'phonenumber': phonenumber!,
      'email': email!,
      'password': password,
      'bankName': bankName,
      'bankAccountNumber': bankAccountNumber,
      'bankUsername': bankUsername,
      'portfolioValue': portfolioValue,
      'dateOfBirth': dateOfBirth,
      'verified': verified,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'loggedAt': loggedAt,
      'deletedAt': deletedAt,
    };
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phonenumber = json['phonenumber'];
    email = json['email'];
    password = json['password'];
    bankName = json['bank_name'];
    bankAccountNumber = json['bank_account_number'];
    bankUsername = json['bank_username'];
    portfolioValue = json['portfolio_value'];
    dateOfBirth = json['date_of_birth'];
    verified = json['verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    loggedAt = json['logged_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phonenumber'] = phonenumber;
    data['email'] = email;
    data['password'] = password;
    data['bank_name'] = bankName;
    data['bank_account_number'] = bankAccountNumber;
    data['bank_username'] = bankUsername;
    data['portfolio_value'] = portfolioValue;
    data['date_of_birth'] = dateOfBirth;
    data['verified'] = verified;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['logged_at'] = loggedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
