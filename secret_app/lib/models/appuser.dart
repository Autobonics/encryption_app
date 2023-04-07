class AppUser {
  final String id;
  final String fullName;
  final String email;
  final String userRole;
  final DateTime regTime;

  AppUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.userRole,
    required this.regTime,
  });

  AppUser.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        userRole = data['userRole'] ?? "",
        regTime =
            data['regTime'] != null ? data['regTime'].toDate() : DateTime.now();

  Map<String, dynamic> toJson(keyword) {
    return {
      'id': id,
      'fullName': fullName,
      'keyword': keyword,
      'email': email,
      'userRole': userRole,
      'regTime': regTime,
    };
  }
}
