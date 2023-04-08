class Chat {
  final String id;
  final String name;
  final String encryptionKey;
  final List<String> members;
  final DateTime createdAt;

  Chat({
    required this.id,
    required this.name,
    required this.encryptionKey,
    required this.members,
    required this.createdAt,
  });

  static Chat fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      name: json['name'],
      encryptionKey: json['encryptionKey'],
      members: List<String>.from(json['members']),
      createdAt: json['createdAt'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'encryptionKey': encryptionKey,
      'members': members,
      'createdAt': createdAt,
    };
  }

  static Chat create(
    String name,
    List<String> members,
    String encryptionKey,
  ) {
    return Chat(
      id: '',
      name: name,
      encryptionKey: encryptionKey,
      members: members,
      createdAt: DateTime.now(),
    );
  }
}
