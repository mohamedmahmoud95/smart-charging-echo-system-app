class User {
  final String id;
  final String name;
  final String email;
  final String profilePic;
  final String phoneNumber;
  final String country;
  final String city;
  final String address;
  final String accessToken;

  User(this.name, this.profilePic, this.phoneNumber, this.country, this.city,
      this.address, this.accessToken,
      {required this.id, required this.email});
}
