enum FromWho { me, her }

class Message {
  String text;
  String? imagUrl;
  FromWho fromwho;

  Message({required this.text, this.imagUrl, required this.fromwho});
}
