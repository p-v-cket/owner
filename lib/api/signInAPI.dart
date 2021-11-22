import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'signInAPI.g.dart';


@RestApi(baseUrl: "https://api.p0cket.co.kr/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("")
  Future<String> helloWorld();

  @POST("/user/signup")
  Future<void> signup(@Body() Customer customer);

  @POST("/user/login")
  Future<String> login(@Field('phone') String phone, @Field("password") String password);

  @GET("user/auth-test")
  Future<String> authTest(@Header('Authorization') bearerToken);
}

@JsonSerializable()
class Customer {
  String name, phone, area, raw_password;

  Customer(
      {required this.name,
      required this.phone,
      required this.area,
      required this.raw_password});

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
