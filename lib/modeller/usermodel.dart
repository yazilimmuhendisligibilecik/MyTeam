class Usermodel {
  final String userID;
  String email;
  String profilfoto;

  Usermodel({this.userID, this.email,this.profilfoto});

  Map<String, dynamic> toMap() {
    return {
      "userID": userID,
      "email": email,
      "profilfoto": profilfoto ??
          "https://eitrawmaterials.eu/wp-content/uploads/2016/09/empty-avatar.jpg",
    };
  }

  Usermodel.toObj(Map<String, dynamic> obje)
      : userID = obje["userID"],
        email = obje["email"],
        profilfoto = obje["profilfoto"];

  @override
  String toString() {
    return "User {userID: $userID email: $email}";
  }
}
