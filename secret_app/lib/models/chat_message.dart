class ChatMessage {
  final String id;
  final String senderId;
  final String message;
  final DateTime timestamp;
  final List<String> fileLinks;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.message,
    required this.timestamp,
    required this.fileLinks,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      senderId: json['senderId'],
      message: json['message'],
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
      'fileLinks': fileLinks,
    };
  }
}
