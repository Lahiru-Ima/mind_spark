class UserModel {
  final String? uid;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phoneNo;
  final String? address;
  final String? password;

  UserModel(
      {this.uid,
      this.firstname,
      this.lastname,
      this.email,
      this.phoneNo,
      this.address,
      this.password});

  toJson() {
    return {
      "FirstName": firstname,
      "LastName": lastname,
      "Email": email,
      "Phone": phoneNo,
      "Address": address,
      "Password": password,
    };
  }
}
