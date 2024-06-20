class AppUser
{
  String? name;
  String? id;
  String? profilePicture;
  String? email;

  AppUser({this.name, this.id, this.profilePicture, this.email});
}

AppUser currentAppUser = AppUser(
  name: "Mohamed",
  id: "12345",
  email: "m.raslan97@gmail.com",
  profilePicture: "assets/images/no_image.png",
);