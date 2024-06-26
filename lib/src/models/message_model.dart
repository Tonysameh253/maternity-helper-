class MessageModel {
  final String senderName;
  final String senderImg;
  final String senderId;
  final String text;
  final DateTime dateTime;

  const MessageModel({
    required this.text,
    required this.senderId,
    required this.senderImg,
    required this.dateTime,
    required this.senderName,
  });
}
