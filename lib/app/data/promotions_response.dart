// To parse this JSON data, do
//
//     final promotionResponse = promotionResponseFromJson(jsonString);

import 'dart:convert';

PromotionResponse promotionResponseFromJson(String str) => PromotionResponse.fromJson(json.decode(str));

String promotionResponseToJson(PromotionResponse data) => json.encode(data.toJson());

class PromotionResponse {
    PromotionResponseData data;
    Meta meta;

    PromotionResponse({
        required this.data,
        required this.meta,
    });

    factory PromotionResponse.fromJson(Map<String, dynamic> json) => PromotionResponse(
        data: PromotionResponseData.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta.toJson(),
    };
}

class PromotionResponseData {
    int id;
    PurpleAttributes attributes;

    PromotionResponseData({
        required this.id,
        required this.attributes,
    });

    factory PromotionResponseData.fromJson(Map<String, dynamic> json) => PromotionResponseData(
        id: json["id"],
        attributes: PurpleAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class PurpleAttributes {
    String name;
    dynamic link;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    Image image;

    PurpleAttributes({
        required this.name,
        required this.link,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.image,
    });

    factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
        name: json["name"],
        link: json["link"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        image: Image.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "image": image.toJson(),
    };
}

class Image {
    ImageData data;

    Image({
        required this.data,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        data: ImageData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class ImageData {
    int id;
    FluffyAttributes attributes;

    ImageData({
        required this.id,
        required this.attributes,
    });

    factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
        id: json["id"],
        attributes: FluffyAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class FluffyAttributes {
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

    FluffyAttributes({
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

    factory FluffyAttributes.fromJson(Map<String, dynamic> json) => FluffyAttributes(
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
    Meta();

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    );

    Map<String, dynamic> toJson() => {
    };
}
