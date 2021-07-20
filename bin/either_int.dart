import 'dart:ffi';

import 'exception_struct.dart';

class EitherInt extends Struct {
  @Int64()
  external int isLeft;

  external ExceptionStruct left;

  @Int64()
  external int right;
}