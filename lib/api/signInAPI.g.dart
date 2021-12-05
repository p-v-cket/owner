// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signInAPI.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      name: json['name'] as String,
      phone: json['phone'] as String,
      raw_password: json['raw_password'] as String,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'raw_password': instance.raw_password,
    };

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      name: json['name'] as String,
      location: json['location'] as String,
      business_number: json['business_number'] as String,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'business_number': instance.business_number,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      area: json['area'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'area': instance.area,
      'phone': instance.phone,
    };

VisitLog _$VisitLogFromJson(Map<String, dynamic> json) => VisitLog(
      created_at: DateTime.parse(json['created_at'] as String),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VisitLogToJson(VisitLog instance) => <String, dynamic>{
      'created_at': instance.created_at.toIso8601String(),
      'user': instance.user,
    };

StoreInfo _$StoreInfoFromJson(Map<String, dynamic> json) => StoreInfo(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      business_number: json['business_number'] as String,
      owner_uuid: json['owner_uuid'] as String,
    );

Map<String, dynamic> _$StoreInfoToJson(StoreInfo instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'location': instance.location,
      'business_number': instance.business_number,
      'owner_uuid': instance.owner_uuid,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.p0cket.co.kr/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<String> helloWorld() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<void> signup(customer) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(customer.toJson());
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/owner/signup',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<String> login(phone, password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'phone': phone, 'password': password};
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/owner/login',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<String> authTest(bearerToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': bearerToken};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'owner/auth-test',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<void> addStore(bearerToken, store) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': bearerToken};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(store.toJson());
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/store',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<List<VisitLog>> visitorList(bearerToken, uuid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': bearerToken};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<VisitLog>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/entry_log/store/${uuid}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => VisitLog.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<StoreInfo>> storeList(bearerToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': bearerToken};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<StoreInfo>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/store/owner',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => StoreInfo.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
