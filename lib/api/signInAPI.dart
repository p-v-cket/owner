import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'signInAPI.g.dart';


@RestApi(baseUrl: "https://api.p0cket.co.kr/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("")
  Future<String> helloWorld();

  @POST("/owner/signup")
  Future<void> signup(@Body() Customer customer);

  @POST("/owner/login")
  Future<String> login(@Field('phone') String phone, @Field("password") String password);

  @GET("owner/auth-test")
  Future<String> authTest(@Header('Authorization') bearerToken);

  @POST("/store")
  Future<void> addStore(@Header('Authorization') bearerToken, @Body() Store store);

  @GET("/entry_log/store/:uuid")
  Future<List<VisitLog>> visitorList(@Header('Authorization') bearerToken, @Path('uuid') String uuid);

  @GET("/store/owner")
  Future<List<StoreInfo>> storeList(@Header('Authorization') bearerToken);

}

@JsonSerializable()
class Customer {
  String name, phone, raw_password;

  Customer(
      {required this.name,
      required this.phone,
      required this.raw_password});

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable()
class Store {
  String name, location, business_number;

  Store(
      {required this.name,
        required this.location,
        required this.business_number});

  factory Store.fromJson(Map<String, dynamic> json) =>
      _$StoreFromJson(json);
  Map<String, dynamic> toJson() => _$StoreToJson(this);
}

@JsonSerializable()
class User {
  String uuid, name, area, phone;

  User({required this.uuid,
    required this.name,
    required this.area,
    required this.phone});

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class VisitLog {
  DateTime created_at;
  User user;

  VisitLog({required this.created_at,
    required this.user,
  });

  factory VisitLog.fromJson(Map<String, dynamic> json) =>
      _$VisitLogFromJson(json);

  Map<String, dynamic> toJson() => _$VisitLogToJson(this);
}

@JsonSerializable()
class StoreInfo {
  String uuid;
  String name;
  String location;
  String business_number;
  String owner_uuid;

  StoreInfo({required this.uuid,
    required this.name,
    required this.location,
    required this.business_number,
    required this.owner_uuid,
  });

  factory StoreInfo.fromJson(Map<String, dynamic> json) =>
      _$StoreInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StoreInfoToJson(this);

}