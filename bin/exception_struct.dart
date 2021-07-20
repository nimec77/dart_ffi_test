import 'dart:ffi';

import 'package:ffi/ffi.dart';

class ExceptionStruct extends Struct {
  external Pointer<Int32> exceptionType;

  external Pointer<Utf8> message;
}