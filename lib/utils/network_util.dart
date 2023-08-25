import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:emba/utils/sharedpref/preferences.dart';
import 'package:emba/utils/sharedpref/shared_prefrence.dart';
class NetworkUtil {
  //Next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;
  final JsonDecoder _decoder = new JsonDecoder();


  Future<dynamic> get(String url, Map<String, String> headers) {
     debugPrint(
     '\n╔══════════════════════════ Response ══════════════════════════\n'
     '╟ get : ${url}\n'
     '╟ token : ${SessionManager.getString(Preferences.ACCESS_TOKEN)}\n'
     // '╟ Data: ${response?.bodyString?.toString() ?? ''}'
     '\n╚══════════════════════════ Response ══════════════════════════\n',
     );
    return http.get(Uri.parse(url),   headers: {
    "Authorization": SessionManager.getString(Preferences.ACCESS_TOKEN),
    }).then((
        http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
            '╟ get >>>>> status : ${response.statusCode}\n'
            '╟ response : ${response.body}\n'
        // '╟ Data: ${response?.bodyString?.toString() ?? ''}'
            '\n╚══════════════════════════ Response ══════════════════════════\n',
      );
      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
        //  throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  } Future<dynamic> getBearer (String url, Map<String, String> headers) {
     debugPrint(
     '\n╔══════════════════════════ Response ══════════════════════════\n'
     '╟ get : ${url}\n'
     '╟ token : ${SessionManager.getString(Preferences.ACCESS_TOKEN)}\n'
     // '╟ Data: ${response?.bodyString?.toString() ?? ''}'
     '\n╚══════════════════════════ Response ══════════════════════════\n',
     );
    return http.get(Uri.parse(url),   headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer "+SessionManager.getString(Preferences.ACCESS_TOKEN),
    }).then((
        http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
            '╟ get >>>>> status : ${response.statusCode}\n'
            '╟ response : ${response.body}\n'
        // '╟ Data: ${response?.bodyString?.toString() ?? ''}'
            '\n╚══════════════════════════ Response ══════════════════════════\n',
      );
      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
        //  throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }
  Future<dynamic> getWithoutHeader(String url) {
    return http.get(Uri.parse(url)).then((
        http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
            '╟ get >>>>> status : ${response.statusCode}\n'
            '╟ response : ${response.body}\n'
        // '╟ Data: ${response?.bodyString?.toString() ?? ''}'
            '\n╚══════════════════════════ Response ══════════════════════════\n',
      );
      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
        //  throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }
  Future<dynamic> delete(String url, {Map? headers, body, encoding}) {
    debugPrint(
      '\n╔══════════════════════════ Response ══════════════════════════\n'
          '╟ delete : ${url}\n'
          '╟ body : $body\n'
          '╟ token : $SessionManager.getString(Preferences.ACCESS_TOKEN)\n'
      // '╟ Data: ${response?.bodyString?.toString() ?? ''}'
          '\n╚══════════════════════════ Response ══════════════════════════\n',
    );
    return http.delete(Uri.parse(url),
        headers: {
          "Authorization": SessionManager.getString(Preferences.ACCESS_TOKEN),
        },
        body: body,
        encoding: encoding).then((
        http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
            '╟ delete >>>>> status : ${response.statusCode}\n'
            '╟ response : ${response.body}\n'
            '\n╚══════════════════════════ Response ══════════════════════════\n',
      );
      // or testing...
      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
        //  throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> postApi(String url, {Map<String, String>? headers, body, encoding}) async {
    debugPrint(
      '\n╔══════════════════════════ Response ══════════════════════════\n'
          '╟  postApi : ${url}\n'
          '╟  body : $body\n'
          '\n╚══════════════════════════ Response ══════════════════════════\n',
    );
       return http
        .post(Uri.parse(url),
        body: body,
        encoding: encoding,
        headers: headers
    )
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
            '╟ get >>>>> status : ${response.statusCode}\n'
            '╟ response : ${response.body}\n'
            '\n╚══════════════════════════ Response ══════════════════════════\n',
      );
      if (statusCode == 203 || statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
        //throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> postWithHeader(String url, {Map? headers, body, encoding}) async {
    debugPrint(
      '\n╔══════════════════════════ Response ══════════════════════════\n'
          '╟ Endpoint : ${url}\n'
          '╟ postWithHeader : ${json.encode(body)}\n'
          '╟ token : ${SessionManager.getString(Preferences.ACCESS_TOKEN)}\n'
          '\n╚══════════════════════════ Response ══════════════════════════\n',
    );
    return http.post(Uri.parse(url),
        body: body,
        headers: {
         "Authorization": SessionManager.getString(Preferences.ACCESS_TOKEN),
              },
        encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
            '╟ postWithHeader >>>>> status : ${response.statusCode}\n'
            '╟ response : ${response.body}\n'
            '\n╚══════════════════════════ Response ══════════════════════════\n',
      );//for testing...

      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
        //throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }  Future<dynamic> postWithHeaderBearer(String url, {Map? headers, body, encoding}) async {
    debugPrint(
      '\n╔══════════════════════════ Response ══════════════════════════\n'
          '╟ Endpoint : ${url}\n'
          '╟ postWithHeader : ${json.encode(body)}\n'
          '╟ token : ${SessionManager.getString(Preferences.ACCESS_TOKEN)}\n'
          '\n╚══════════════════════════ Response ══════════════════════════\n',
    );
    return http.post(Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer "+SessionManager.getString(Preferences.ACCESS_TOKEN),
              },
        encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
            '╟ postWithHeader >>>>> status : ${response.statusCode}\n'
            '╟ response : ${response.body}\n'
            '\n╚══════════════════════════ Response ══════════════════════════\n',
      );//for testing...

      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
        //throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }


  Future<dynamic> putApiWithHeader(String url, {Map? headers, body, encoding}) async {
    debugPrint(
      '\n╔══════════════════════════ Response ══════════════════════════\n'
          '╟ Endpoint : $url\n'
          '╟ putApiWithHeader : ${json.encode(body)}\n'
          '╟ token : ${SessionManager.getString(Preferences.ACCESS_TOKEN)}\n'
          '\n╚══════════════════════════ Response ══════════════════════════\n',
    );
    return http
        .put(Uri.parse(url),
        body: body,
        headers: {
          "Authorization": SessionManager.getString(Preferences.ACCESS_TOKEN),
        },
        encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
            '╟  >>>>> status : ${response.statusCode}\n'
            '╟ response : ${response.body}\n'
            '\n╚══════════════════════════ Response ══════════════════════════\n',
      );
      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
        //throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }
  Future<dynamic> putApiWithHeaderBearer(String url, {Map? headers, body, encoding}) async {
    debugPrint(
      '\n╔══════════════════════════ Response ══════════════════════════\n'
          '╟ Endpoint : $url\n'
          '╟ putApiWithHeader : ${json.encode(body)}\n'
          '╟ token : ${SessionManager.getString(Preferences.ACCESS_TOKEN)}\n'
          '\n╚══════════════════════════ Response ══════════════════════════\n',
    );
    return http
        .put(Uri.parse(url),
        body: body,
        headers: {
          "Authorization": "Bearer "+SessionManager.getString(Preferences.ACCESS_TOKEN),
        },
        encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
            '╟  >>>>> status : ${response.statusCode}\n'
            '╟ response : ${response.body}\n'
            '\n╚══════════════════════════ Response ══════════════════════════\n',
      );
      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
        //throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> deleteApiWithHeader(String url, {Map? headers, body, encoding}) async {
    print(" Endpoint : $url, deleteApiWithHeader body : ${json.encode(body)} , token : ${SessionManager.getString(Preferences.ACCESS_TOKEN)}");
    debugPrint(
      '\n╔══════════════════════════ Response ══════════════════════════\n'
          '╟  Endpoint : $url\n'
          '╟  deleteApiWithHeader body : ${json.encode(body)}\n'
          '╟  token : ${SessionManager.getString(Preferences.ACCESS_TOKEN)}\n'
          '\n╚══════════════════════════ Response ══════════════════════════\n',
    );
    return http
        .delete(Uri.parse(url),
        body: body,
        headers: {
          "Authorization": SessionManager.getString(Preferences.ACCESS_TOKEN),
        },
        encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
        //throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }
  Future<dynamic> deleteApiWithHeaderBearear(String url, {Map? headers, body, encoding}) async {
    print(" Endpoint : $url, deleteApiWithHeader body : ${json.encode(body)} , token : ${SessionManager.getString(Preferences.ACCESS_TOKEN)}");
    debugPrint(
      '\n╔══════════════════════════ Response ══════════════════════════\n'
          '╟  Endpoint : $url\n'
          '╟  deleteApiWithHeader body : ${json.encode(body)}\n'
          '╟  token : ${SessionManager.getString(Preferences.ACCESS_TOKEN)}\n'
          '\n╚══════════════════════════ Response ══════════════════════════\n',
    );
    return http
        .delete(Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer "+SessionManager.getString(Preferences.ACCESS_TOKEN),
        },
        encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
        //throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> postWithHeaders(String url,
      {Map? headers, body, encoding}) async {
    var jsonEncode = json.encode(
        body);

    return http.post(Uri.parse(url),
        body: jsonEncode,
        headers: {
          "Authorization": "Bearer "+SessionManager.getString(Preferences.ACCESS_TOKEN),
          "Content-Type": "application/json"
        },
        encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
        //throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }
}

