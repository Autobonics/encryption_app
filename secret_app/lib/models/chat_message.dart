class ChatMessage {
  final String id;
  final String senderId;
  final String message;
  final int securityLevel;
  final DateTime timestamp;
  final List<String> fileLinks;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.message,
    required this.securityLevel,
    required this.timestamp,
    required this.fileLinks,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      senderId: json['senderId'],
      message: json['message'],
      securityLevel: json['securityLevel'] ?? 0,
      timestamp: json['timestamp'].toDate(),
      fileLinks: List<String>.from(json['fileLinks'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'message': message,
      'timestamp': timestamp,
      'securityLevel': securityLevel,
      'fileLinks': fileLinks,
    };
  }

  ChatMessage copyWith({
    String? id,
    String? senderId,
    String? message,
    int? securityLevel,
    List<String>? fileLinks,
    DateTime? timestamp,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      message: message ?? this.message,
      securityLevel: securityLevel ?? this.securityLevel,
      fileLinks: fileLinks ?? this.fileLinks,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
