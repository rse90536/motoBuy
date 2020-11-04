class UserData {
  final int userId;
  final dynamic account;
  final dynamic email;
  final dynamic status;
  final dynamic exp;
  final dynamic iss;


  UserData(
      {this.userId, this.account, this.email, this.status, this.exp, this.iss,});

  factory UserData.fromJson(Map<String, dynamic> parsedJson) {
    return UserData(
      userId: parsedJson['User_id'],
      account: parsedJson['Account'],
      email: parsedJson['Email'],
      status: parsedJson['Status'],
      exp: parsedJson['exp'],
      iss: parsedJson['iss'],
    );
  }
}
