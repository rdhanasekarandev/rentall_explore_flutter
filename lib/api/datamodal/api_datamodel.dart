import 'dart:convert';

RentAllListing rentAllListingFromJson(String str) => RentAllListing.fromJson(json.decode(str));

String rentAllListingToJson(RentAllListing data) => json.encode(data.toJson());

class RentAllListing {
  RentAllListing({
    this.data,
  });

  Data data;

  factory RentAllListing.fromJson(Map<String, dynamic> json) => RentAllListing(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.getMostViewedListing,
    this.getRecommend,
  });

  Get getMostViewedListing;
  Get getRecommend;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    getMostViewedListing: json["getMostViewedListing"] == null ? null : Get.fromJson(json["getMostViewedListing"]),
    getRecommend: json["getRecommend"] == null ? null : Get.fromJson(json["getRecommend"]),
  );

  Map<String, dynamic> toJson() => {
    "getMostViewedListing": getMostViewedListing == null ? null : getMostViewedListing.toJson(),
    "getRecommend": getRecommend == null ? null : getRecommend.toJson(),
  };
}

class Get {
  Get({
    this.results,
    this.status,
  });

  List<Result> results;
  int status;

  factory Get.fromJson(Map<String, dynamic> json) => Get(
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
    "status": status == null ? null : status,
  };
}

class Result {
  Result({
    this.id,
    this.title,
    this.personCapacity,
    this.beds,
    this.bookingType,
    this.coverPhoto,
    this.reviewsCount,
    this.reviewsStarRating,
    this.listPhotos,
    this.listingData,
    this.settingsData,
    this.wishListStatus,
    this.wishListGroupCount,
    this.isListOwner,
    this.listPhotoName,
    this.roomType,
  });

  int id;
  String title;
  int personCapacity;
  int beds;
  BookingType bookingType;
  int coverPhoto;
  int reviewsCount;
  int reviewsStarRating;
  List<ListPhoto> listPhotos;
  ListingData listingData;
  List<SettingsDatum> settingsData;
  bool wishListStatus;
  int wishListGroupCount;
  bool isListOwner;
  String listPhotoName;
  String roomType;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    personCapacity: json["personCapacity"] == null ? null : json["personCapacity"],
    beds: json["beds"] == null ? null : json["beds"],
    bookingType: json["bookingType"] == null ? null : bookingTypeValues.map[json["bookingType"]],
    coverPhoto: json["coverPhoto"] == null ? null : json["coverPhoto"],
    reviewsCount: json["reviewsCount"] == null ? null : json["reviewsCount"],
    reviewsStarRating: json["reviewsStarRating"] == null ? null : json["reviewsStarRating"],
    listPhotos: json["listPhotos"] == null ? null : List<ListPhoto>.from(json["listPhotos"].map((x) => ListPhoto.fromJson(x))),
    listingData: json["listingData"] == null ? null : ListingData.fromJson(json["listingData"]),
    settingsData: json["settingsData"] == null ? null : List<SettingsDatum>.from(json["settingsData"].map((x) => SettingsDatum.fromJson(x))),
    wishListStatus: json["wishListStatus"] == null ? null : json["wishListStatus"],
    wishListGroupCount: json["wishListGroupCount"] == null ? null : json["wishListGroupCount"],
    isListOwner: json["isListOwner"] == null ? null : json["isListOwner"],
    listPhotoName: json["listPhotoName"] == null ? null : json["listPhotoName"],
    roomType: json["roomType"] == null ? null : json["roomType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "personCapacity": personCapacity == null ? null : personCapacity,
    "beds": beds == null ? null : beds,
    "bookingType": bookingType == null ? null : bookingTypeValues.reverse[bookingType],
    "coverPhoto": coverPhoto == null ? null : coverPhoto,
    "reviewsCount": reviewsCount == null ? null : reviewsCount,
    "reviewsStarRating": reviewsStarRating == null ? null : reviewsStarRating,
    "listPhotos": listPhotos == null ? null : List<dynamic>.from(listPhotos.map((x) => x.toJson())),
    "listingData": listingData == null ? null : listingData.toJson(),
    "settingsData": settingsData == null ? null : List<dynamic>.from(settingsData.map((x) => x.toJson())),
    "wishListStatus": wishListStatus == null ? null : wishListStatus,
    "wishListGroupCount": wishListGroupCount == null ? null : wishListGroupCount,
    "isListOwner": isListOwner == null ? null : isListOwner,
    "listPhotoName": listPhotoName == null ? null : listPhotoName,
    "roomType": roomType == null ? null : roomType,
  };
}

enum BookingType { REQUEST, INSTANT }

final bookingTypeValues = EnumValues({
  "instant": BookingType.INSTANT,
  "request": BookingType.REQUEST
});

class ListPhoto {
  ListPhoto({
    this.id,
    this.name,
    this.type,
    this.status,
  });

  int id;
  String name;
  Type type;
  dynamic status;

  factory ListPhoto.fromJson(Map<String, dynamic> json) => ListPhoto(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    type: json["type"] == null ? null : typeValues.map[json["type"]],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "type": type == null ? null : typeValues.reverse[type],
    "status": status,
  };
}

enum Type { IMAGE_JPEG }

final typeValues = EnumValues({
  "image/jpeg": Type.IMAGE_JPEG
});

class ListingData {
  ListingData({
    this.basePrice,
    this.currency,
  });

  int basePrice;
  String currency;

  factory ListingData.fromJson(Map<String, dynamic> json) => ListingData(
    basePrice: json["basePrice"] == null ? null : json["basePrice"],
    currency: json["currency"] == null ? null : json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "basePrice": basePrice == null ? null : basePrice,
    "currency": currency == null ? null : currency,
  };
}

class SettingsDatum {
  SettingsDatum({
    this.listsettings,
  });

  Listsettings listsettings;

  factory SettingsDatum.fromJson(Map<String, dynamic> json) => SettingsDatum(
    listsettings: json["listsettings"] == null ? null : Listsettings.fromJson(json["listsettings"]),
  );

  Map<String, dynamic> toJson() => {
    "listsettings": listsettings == null ? null : listsettings.toJson(),
  };
}

class Listsettings {
  Listsettings({
    this.id,
    this.itemName,
  });

  int id;
  String itemName;

  factory Listsettings.fromJson(Map<String, dynamic> json) => Listsettings(
    id: json["id"] == null ? null : json["id"],
    itemName: json["itemName"] == null ? null : json["itemName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "itemName": itemName == null ? null : itemName,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
