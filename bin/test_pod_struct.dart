import 'dart:ffi';

import 'package:ffi/ffi.dart';

class TestPodStruct extends Struct {
  @Int64()
  external int a;

  external Pointer<Utf8> text;
}