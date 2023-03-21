class AppUser {
  final String id;
  final String fullName;
  final String email;
  final String userRole;

  AppUser(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.userRole});

  AppUser.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        userRole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'userRole': userRole,
    };
  }
}
