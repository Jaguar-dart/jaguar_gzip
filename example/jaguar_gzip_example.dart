// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:jaguar_gzip/jaguar_gzip.dart';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';
import 'package:jaguar_static_file/jaguar_static_file.dart';

@Api(path: '/api')
class ExampleApi {
  @WrapGzipStream()
  @WrapStaticFile()
  @Get(path: '/hello.txt')
  Response<JaguarFile> getHelloTxt() =>
      new Response<JaguarFile>(new JaguarFile('example/data/hello.txt'));
}

main() async {
  Jaguar conf = new Jaguar();
  conf.addApi(reflectJaguar(new ExampleApi()));
  await conf.serve();
}
