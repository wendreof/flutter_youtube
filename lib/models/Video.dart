class Video {
  String id;
  String title;
  String desc;
  String image;
  String channel;

  Video({this.id, this.title, this.desc, this.image, this.channel});

  static jsonConverter(Map<String, dynamic> json) {
    return Video(
        id: json["id"]["videoId"],
        title: json["snippet"]["title"],
        image: json["snippet"]["thumbnails"]["high"]["url"],
        channel: json["snippet"]["channelId"]);
  }

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        id: json["id"]["videoId"],
        title: json["snippet"]["title"],
        desc: json["snippet"]["description"],
        image: json["snippet"]["thumbnails"]["high"]["url"],
        channel: json["snippet"]["channelId"]);
  }
}
