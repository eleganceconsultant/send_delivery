// To parse this JSON data, do
//
//     final washStoreResponse = washStoreResponseFromJson(jsonString);

import 'dart:convert';

WashStoreResponse washStoreResponseFromJson(String str) => WashStoreResponse.fromJson(json.decode(str));

String washStoreResponseToJson(WashStoreResponse data) => json.encode(data.toJson());

class WashStoreResponse {
    List<Datum> data;
    Meta meta;

    WashStoreResponse({
        required this.data,
        required this.meta,
    });

    factory WashStoreResponse.fromJson(Map<String, dynamic> json) => WashStoreResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class Datum {
    int id;
    DatumAttributes attributes;

    Datum({
        required this.id,
        required this.attributes,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: DatumAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class DatumAttributes {
    String name;
    double lat;
    double long;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    ProfileImage profileImage;

    DatumAttributes({
        required this.name,
        required this.lat,
        required this.long,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.profileImage,
    });

    factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
        name: json["name"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "lat": lat,
        "long": long,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "profile_image": profileImage.toJson(),
    };
}

class ProfileImage {
    Data data;

    ProfileImage({
        required this.data,
    });

    factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    int id;
    DataAttributes attributes;

    Data({
        required this.id,
        required this.attributes,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: DataAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class DataAttributes {
    String name;
    dynamic alternativeText;
    dynamic caption;
    int width;
    int height;
    Formats formats;
    String hash;
    String ext;
    String mime;
    double size;
    String url;
    dynamic previewUrl;
    String provider;
    dynamic providerMetadata;
    DateTime createdAt;
    DateTime updatedAt;

    DataAttributes({
        required this.name,
        required this.alternativeText,
        required this.caption,
        required this.width,
        required this.height,
        required this.formats,
        required this.hash,
        required this.ext,
        required this.mime,
        required this.size,
        required this.url,
        required this.previewUrl,
        required this.provider,
        required this.providerMetadata,
        required this.createdAt,
        required this.updatedAt,
    });

    factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats.toJson(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Formats {
    Thumbnail thumbnail;

    Formats({
        required this.thumbnail,
    });

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
    };
}

class Thumbnail {
    String name;
    String hash;
    String ext;
    String mime;
    dynamic path;
    int width;
    int height;
    double size;
    String url;

    Thumbnail({
        required this.name,
        required this.hash,
        required this.ext,
        required this.mime,
        required this.path,
        required this.width,
        required this.height,
        required this.size,
        required this.url,
    });

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        path: json["path"],
        width: json["width"],
        height: json["height"],
        size: json["size"]?.toDouble(),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "path": path,
        "width": width,
        "height": height,
        "size": size,
        "url": url,
    };
}

class Meta {
    Pagination pagination;

    Meta({
        required this.pagination,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
    };
}

class Pagination {
    int page;
    int pageSize;
    int pageCount;
    int total;

    Pagination({
        required this.page,
        required this.pageSize,
        required this.pageCount,
        required this.total,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
    };
}
