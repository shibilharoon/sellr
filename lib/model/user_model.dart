
class UserModel {
  String? name;
  String? email;
  String? image;
  String? uid;
  String? phonenumber;
  UserModel({required this.name,this.image, this.email, this.phonenumber, this.uid});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        phonenumber: json['phonenumber'],
        image: json['image'],
        uid: json['uid']);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'phonenumber': phonenumber,
      'image':image
    };
  }
}
