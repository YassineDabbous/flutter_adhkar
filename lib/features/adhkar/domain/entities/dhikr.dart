abstract class Dhikr {
  int id;
  int count;
  int collectionId;
  int categoryId;
  String title;
  String content;
  String footer;
  String link;
  String image;
  String audio;
  String file;
  String? imageOffline;
  String? audioOffline;
  String? fileOffline;

  Dhikr(this.id, this.count, this.collectionId, this.categoryId, this.title, this.content, this.footer, this.image, this.audio, this.file, this.link,
      this.imageOffline, this.audioOffline, this.fileOffline);
}
