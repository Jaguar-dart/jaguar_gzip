# jaguar_gzip

Gzip compressor interceptors for Jaguar

## Usage

A simple usage example:

```dart
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
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/Jaguar-dart/jaguar_gzip/issues
