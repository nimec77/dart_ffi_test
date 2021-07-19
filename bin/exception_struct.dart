import 'dart:ffi';

import 'package:ffi/ffi.dart';

class ExceptionStruct extends Struct {
  @Uint64()
  external int exceptionType;

  external Pointer<Utf8> message;
}