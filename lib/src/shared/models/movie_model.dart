// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

MovieModel movieModelFromJson(String str) => MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  
    String id;
    String title;
    String originalTitle;
    bool inPreSale;
    String duration;
    String contentRating;
    String distributor;
    String urlKey;
    String siteUrl;
    String siteUrlByTheater;
    String boxOfficeId;
    String ancineId;
    List<ImageModel> images;
    List<TrailerModel> trailers;
    List<String> genres;
    List<dynamic> tags;
    List<dynamic> completeTags;
    List<RoomModel> rooms;

    MovieModel({
        this.id,
        this.title,
        this.originalTitle,
        this.inPreSale,
        this.duration,
        this.contentRating,
        this.distributor,
        this.urlKey,
        this.siteUrl,
        this.siteUrlByTheater,
        this.boxOfficeId,
        this.ancineId,
        this.images,
        this.trailers,
        this.genres,
        this.tags,
        this.completeTags,
        this.rooms,
    });

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        originalTitle: json["originalTitle"],
        inPreSale: json["inPreSale"],
        duration: json["duration"],
        contentRating: json["contentRating"],
        distributor: json["distributor"],
        urlKey: json["urlKey"],
        siteUrl: json["siteURL"],
        siteUrlByTheater: json["siteURLByTheater"],
        boxOfficeId: json["boxOfficeId"],
        ancineId: json["ancineId"],
        images: List<ImageModel>.from(json["images"].map((x) => ImageModel.fromJson(x))),
        trailers: List<TrailerModel>.from(json["trailers"].map((x) => TrailerModel.fromJson(x))),
        genres: List<String>.from(json["genres"].map((x) => x)),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        completeTags: List<dynamic>.from(json["completeTags"].map((x) => x)),
        rooms: List<RoomModel>.from(json["rooms"].map((x) => RoomModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "originalTitle": originalTitle,
        "inPreSale": inPreSale,
        "duration": duration,
        "contentRating": contentRating,
        "distributor": distributor,
        "urlKey": urlKey,
        "siteURL": siteUrl,
        "siteURLByTheater": siteUrlByTheater,
        "boxOfficeId": boxOfficeId,
        "ancineId": ancineId,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "trailers": List<dynamic>.from(trailers.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "completeTags": List<dynamic>.from(completeTags.map((x) => x)),
        "rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
    };

    
    static List<MovieModel> fromJsonList(List list){
      if(list == null) return null;
      return list
        .map((item) => MovieModel.fromJson(item))
        .toList();
    }
}

class ImageModel {
    String url;
    String type;

    ImageModel({
        this.url,
        this.type,
    });

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        url: json["url"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "type": type,
    };
}

class RoomModel {
    String name;
    List<SessionModel> sessions;

    RoomModel({
        this.name,
        this.sessions,
    });

    factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        name: json["name"],
        sessions: List<SessionModel>.from(json["sessions"].map((x) => SessionModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "sessions": List<dynamic>.from(sessions.map((x) => x.toJson())),
    };
}

class SessionModel {
    String id;
    double price;
    List<String> type;
    List<TypeModel> types;
    DateModel date;
    DateModel realDate;
    String time;
    String defaultSector;
    String siteUrl;
    bool hasSeatSelection;
    bool enabled;
    String blockMessage;

    SessionModel({
        this.id,
        this.price,
        this.type,
        this.types,
        this.date,
        this.realDate,
        this.time,
        this.defaultSector,
        this.siteUrl,
        this.hasSeatSelection,
        this.enabled,
        this.blockMessage,
    });

    factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
        id: json["id"],
        price: json["price"].toDouble(),
        type: List<String>.from(json["type"].map((x) => x)),
        types: List<TypeModel>.from(json["types"].map((x) => TypeModel.fromJson(x))),
        date: DateModel.fromJson(json["date"]),
        realDate: DateModel.fromJson(json["realDate"]),
        time: json["time"],
        defaultSector: json["defaultSector"],
        siteUrl: json["siteURL"],
        hasSeatSelection: json["hasSeatSelection"],
        enabled: json["enabled"],
        blockMessage: json["blockMessage"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "type": List<dynamic>.from(type.map((x) => x)),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "date": date.toJson(),
        "realDate": realDate.toJson(),
        "time": time,
        "defaultSector": defaultSector,
        "siteURL": siteUrl,
        "hasSeatSelection": hasSeatSelection,
        "enabled": enabled,
        "blockMessage": blockMessage,
    };
}

class DateModel {
    DateTime localDate;
    bool isToday;
    String dayOfWeek;
    String dayAndMonth;
    String hour;
    String year;

    DateModel({
        this.localDate,
        this.isToday,
        this.dayOfWeek,
        this.dayAndMonth,
        this.hour,
        this.year,
    });

    factory DateModel.fromJson(Map<String, dynamic> json) => DateModel(
        localDate: DateTime.parse(json["localDate"]),
        isToday: json["isToday"],
        dayOfWeek: json["dayOfWeek"],
        dayAndMonth: json["dayAndMonth"],
        hour: json["hour"],
        year: json["year"],
    );

    Map<String, dynamic> toJson() => {
        "localDate": localDate.toIso8601String(),
        "isToday": isToday,
        "dayOfWeek": dayOfWeek,
        "dayAndMonth": dayAndMonth,
        "hour": hour,
        "year": year,
    };
}

class TypeModel {
    int id;
    String name;
    String alias;
    bool display;

    TypeModel({
        this.id,
        this.name,
        this.alias,
        this.display,
    });

    factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        id: json["id"],
        name: json["name"],
        alias: json["alias"],
        display: json["display"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alias": alias,
        "display": display,
    };
}

class TrailerModel {
    String type;
    String url;
    String embeddedUrl;

    TrailerModel({
        this.type,
        this.url,
        this.embeddedUrl,
    });

    factory TrailerModel.fromJson(Map<String, dynamic> json) => TrailerModel(
        type: json["type"],
        url: json["url"],
        embeddedUrl: json["embeddedUrl"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
        "embeddedUrl": embeddedUrl,
    };
}
