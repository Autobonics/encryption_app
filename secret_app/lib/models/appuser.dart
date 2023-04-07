class AppUser {
  final String id;
  final String fullName;
  final String photoUrl;
  final String email;
  final String userRole;
  final DateTime regTime;

  AppUser({
    required this.id,
    required this.fullName,
    required this.photoUrl,
    required this.email,
    required this.userRole,
    required this.regTime,
  });

  AppUser.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        photoUrl = data['photoUrl'],
        email = data['email'],
        userRole = data['userRole'] ?? "",
        regTime =
            data['regTime'] != null ? data['regTime'].toDate() : DateTime.now();

  Map<String, dynamic> toJson(keyword) {
    return {
      'id': id,
      'fullName': fullName,
      'photoUrl': photoUrl,
      'keyword': keyword,
      'email': email,
      'userRole': userRole,
      'regTime': regTime,
    };
  }
}
