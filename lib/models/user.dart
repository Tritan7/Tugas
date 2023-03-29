class User {
  final int id;
  final String name;
  final String userName;
  final String email;
  final String? profilePhoto;
  final String? phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    this.profilePhoto,
    this.phoneNumber,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["id"],
      name: map["name"],
      userName: map["user_name"],
      email: map["email"],
      profilePhoto: map["profile_photo"],
      phoneNumber: map["phone_number"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "user_name": userName,
      "email": email,
      "profile_photo": profilePhoto,
      "phoneNumber": phoneNumber,
    };
  }

  factory User.dummy() {
    return User(
      id: 001,
      name: "Triyanda Putra D",
      userName: "tritan",
      email: "2006151@itg.ac.id",
      profilePhoto:
          "https://imagecache.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/41fec3f2-191e-43ee-f536-8bc668e0e100/width=1200/41fec3f2-191e-43ee-f536-8bc668e0e100",
      phoneNumber: "085123456789",
    );
  }
}
