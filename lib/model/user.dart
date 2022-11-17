class User {
String ?userName;
String? email;
int ? phoneNUmber;

User({this.email, this.phoneNUmber, this.userName, required name});

User.fromMap(dynamic obj ) {
userName = obj["name"];
email = obj["email"]?? '';
phoneNUmber = obj["phone"];
}

String ? get username => userName;
String? get userMail => email;
int? get phone => phoneNUmber;

Map <String, dynamic> toMap() {
  var map = <String, dynamic>{};
  map ["name"] = userName;
  map ["email"] = email;
  map ["phone"] = phoneNUmber;

  return map;
}
}

