import 'dart:ffi';

import 'package:ffi/ffi.dart';

class ExceptionStruct extends Struct {
  @Int32()
  external int exceptionType;

  external Pointer<Utf8> message;
}