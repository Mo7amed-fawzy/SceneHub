// sender.dart
enum Sender { user, bot }

// message.dart
class Message {
  final String text;
  final Sender sender;

  Message({required this.text, required this.sender});
}

// media_type.dart
enum MediaType { movie, tv }

// // predefined_option.dart
// class PredefinedOption {
//   final String text;
//   final MediaType? type; // optional, for media selection
//   final bool? sendsToAI; //  nullable

//   PredefinedOption({required this.text, this.type, this.sendsToAI});
// }

// // conversation_step.dart
// class ConversationStep {
//   final String botMessage;
//   final List<PredefinedOption> options;

//   ConversationStep({required this.botMessage, this.options = const []});
// }
