import 'dart:ffi';

import 'exception_struct.dart';
import 'test_pod_struct.dart';

class EitherPod extends Struct {
  @Int64()
  external int isLeft;

  external ExceptionStruct left;

  external TestPodStruct right;

}