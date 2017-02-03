// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:jaguar/jaguar.dart';
import 'dart:convert' show Utf8Encoder;
import 'dart:io' show HttpHeaders, ZLibEncoder;

final ZLibEncoder _gzip = new ZLibEncoder(gzip: true);

final Utf8Encoder _utf8 = new Utf8Encoder();

class WrapGzipStream implements RouteWrapper<GzipStream> {
  final String id = null;

  final Map<Symbol, MakeParam> makeParams = null;

  const WrapGzipStream();

  GzipStream createInterceptor() => new GzipStream();
}

class GzipStream extends Interceptor {
  Future<Response<Stream<List<int>>>> post(
      Response<Stream<List<int>>> incoming) async {
    Response<Stream<List<int>>> ret = new Response.cloneExceptValue(incoming);
    ret.headers.set(HttpHeaders.CONTENT_ENCODING, 'gzip');

    ret.value = _gzip.bind(incoming.value);

    return ret;
  }
}

class WrapGzipUtf8String implements RouteWrapper<GzipUtf8String> {
  final String id = null;

  final Map<Symbol, MakeParam> makeParams = null;

  const WrapGzipUtf8String();

  GzipUtf8String createInterceptor() => new GzipUtf8String();
}

class GzipUtf8String extends Interceptor {
  Future<Response<List<int>>> post(Response<String> incoming) async {
    Response<List<int>> ret = new Response.cloneExceptValue(incoming);
    ret.headers.set(HttpHeaders.CONTENT_ENCODING, 'gzip');
    ret.headers.charset = 'utf-8';

    ret.value = _gzip.convert(_utf8.convert(incoming.value));

    return ret;
  }
}
