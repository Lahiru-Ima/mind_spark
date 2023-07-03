class DoctorModel {
  final String? uid;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phoneNo;
  final String? address;
  final String? nic;
  final String? education;
  final String? qualification;
  final String? experience;
  final String? currentworkingplace;
  final String? workplacenumber;
  final String? password;

  DoctorModel({
      this.nic,
      this.education,
      this.qualification,
      this.experience,
      this.currentworkingplace,
      this.workplacenumber,
      this.uid,
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
      "PhoneNumber": phoneNo,
      "Address": address,
      "NIC":nic,
      "Education":education,
      "Qulification": qualification,
      "Experience": experience,
      "CurrentWorkingPlace": currentworkingplace,
      "WorkplaceNumber"
      "Password": password,
    };
  }
}
