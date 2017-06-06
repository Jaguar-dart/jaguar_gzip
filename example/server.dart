// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:jaguar_gzip/jaguar_gzip.dart';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';
import 'package:jaguar_static_file/jaguar_static_file.dart';

@Api(path: '/api')
class ExampleApi {
  @Get(path: '/hello.txt')
  @Wrap(const [#gzipStream, #staticFile])
  Response<JaguarFile> getHelloTxt(Context ctx) =>
      new Response<JaguarFile>(new JaguarFile('example/static/hello.txt'));

  @Get(path: '/info')
  @WrapOne(#gzipUtf8String)
  Response<String> getInfo(Context ctx) => Response.json({"Server": "Jaguar"});

  StaticFile staticFile(Context ctx) => new StaticFile();

  GzipStream gzipStream(Context ctx) => new GzipStream();

  GzipUtf8String gzipUtf8String(Context ctx) => new GzipUtf8String();
}

main() async {
  Jaguar conf = new Jaguar();
  conf.addApi(reflectJaguar(new ExampleApi()));
  await conf.serve();
}
