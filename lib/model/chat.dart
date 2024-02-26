class Chat {
  final String id;
  final String name;
  final String message;
  final String imageUrl;
  final bool isGemini;

  Chat(
      {required this.id,
      required this.name,
      required this.message,
      required this.imageUrl,
      this.isGemini = false});
}
