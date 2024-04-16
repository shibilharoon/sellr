class UserModel {
  String? name;
  String? email;
  String? image;
  String? place;
  String? uid;
  String? phonenumber;
  String? bio;
  UserModel(
      {required this.name,
      this.image,
      this.email,
      this.phonenumber,
      this.uid,
      this.place,
      this.bio});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        phonenumber: json['phonenumber'],
        image: json['image'],
        place: json["place"],
        bio: json["bio"],
        uid: json['uid']);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'phonenumber': phonenumber,
      'image': image,
      'place': place,
      'bio':bio
    };
  }
}
