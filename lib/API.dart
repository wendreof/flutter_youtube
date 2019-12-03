import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/Video.dart';

const API_KEY = "AIzaSyAU7HVxz_rxj1pIXtEv85QyHuELQWL00sM";
const CHANNEL_ID = "UCHCcdjkFeWndu5UixT1xswQ";
const BASE_URL = "https://www.googleapis.com/youtube/v3/";

class API {
  Future<List<Video>> search(String search) async {
    http.Response res = await http.get(BASE_URL +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$API_KEY"
            "&channelId=$CHANNEL_ID"
            "&q=$search");

    if (res.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(res.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {}
  }
}
