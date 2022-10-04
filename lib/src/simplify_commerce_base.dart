// TODO: Put public facing types in this file.

@JS()
library simplify_commerce;

import 'dart:async';
import 'dart:convert';
import 'dart:js';

import 'package:js/js.dart';

String jsApi = "https://www.simplify.com/commerce/v1/simplify.js";

class SimplifyCommerce {
  static Future generateToken(jsApi, Object obj) {
    Completer c = Completer();
    SimplifyCommerceApi.generateToken(jsApi, allowInterop((var result) {
      var obj = jsonDecode(context['JSON']('stringify', [result]));
      c.complete(SimplifyCommerce._apiResult(obj));
    }), allowInterop((var result) {
      c.completeError(result);
    }));

    return c.future;
  }

  static Map _apiResult(Map obj) {
    return obj;
  }
}

@JS('SimplifyCommerce')
class SimplifyCommerceApi {
  external static Map generateToken(
      Object obj, Function success, Function failure);
}
