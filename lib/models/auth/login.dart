class LoginPharmacyModel {
    LoginPharmacyModel({
        this.status,
        this.code,
        this.msg,
        this.data,
    });

    bool? status;
    int? code;
    String? msg;
    Data? data;

    factory LoginPharmacyModel.fromJson(Map<String, dynamic>? json) => LoginPharmacyModel(
        status: json?["status"],
        code: json?["code"],
        msg: json?["msg"],
        data: json?["data"] == null ? null : Data.fromJson(json?["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "msg": msg,
        "data": data == null ? null : data!.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.name,
        this.email,
        this.phone1,
        this.phone2,
        this.photo,
        this.owner,
        this.description,
        this.address,
        this.location,
        this.active,
        this.orderByPhoto,
        this.deviceToken,
        this.areaId,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.deliveryTime,
        this.token,
    });

    int? id;
    String? name;
    String? email;
    String? phone1;
    String? phone2;
    String? photo;
    String? owner;
    String? description;
    String? address;
    String? location;
    int? active;
    int? orderByPhoto;
    String? deviceToken;
    int? areaId;
    double? latitude;
    double? longitude;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? deliveryTime;
    String? token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone1: json["phone1"],
        phone2: json["phone2"],
        photo: json["photo"],
        owner: json["owner"],
        description: json["description"],
        address: json["address"],
        location: json["location"],
        active: json["active"],
        orderByPhoto: json["order_by_photo"],
        deviceToken: json["device_token"],
        areaId: json["area_id"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        deliveryTime: json["delivery_time"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone1": phone1,
        "phone2": phone2,
        "photo": photo,
        "owner": owner,
        "description": description,
        "address": address,
        "location": location,
        "active": active,
        "order_by_photo": orderByPhoto,
        "device_token": deviceToken,
        "area_id": areaId,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "delivery_time": deliveryTime,
        "token": token,
    };
}
