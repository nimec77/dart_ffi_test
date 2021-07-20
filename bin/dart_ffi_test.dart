import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'either_int.dart';
import 'either_pod.dart';
import 'exception_struct.dart';

// typedef add_func = Int32 Function(Int32, Int32);
// typedef AddFunc = int Function(int, int);
// typedef copy_str_func = Pointer<Utf8> Function(Pointer<Utf8>);
// typedef CopyStrFunc = Pointer<Utf8> Function(Pointer<Utf8>);
// typedef free_buf_func = Void Function(Pointer<Utf8>);
// typedef FreeBufFunc = void Function(Pointer<Utf8>);
typedef ExceptionTest = Pointer<ExceptionStruct> Function();
typedef EitherTestRight = Pointer<EitherInt> Function();
typedef EitherTestLeft = Pointer<EitherInt> Function();
typedef EitherPodTest = Pointer<EitherPod> Function();

void main(List<String> arguments) {
  final dyLib = DynamicLibrary.open('utils/libutils.so');
  // final add = dyLib.lookupFunction<add_func, AddFunc>('add');
  // final result = add(40, 2);
  // print(result);
  //
  // final copyStr = dyLib.lookupFunction<copy_str_func, CopyStrFunc>('copy_str');
  // final hello = 'Тест!'.toNativeUtf8();
  // final copyResult = copyStr(hello);
  // print(copyResult.toDartString());
  // malloc.free(hello);
  // final freeBuf = dyLib.lookupFunction<free_buf_func, FreeBufFunc>('free_buf');
  // print(copyResult);
  // freeBuf(copyResult);

  final exceptionTestPointer = dyLib.lookup<NativeFunction<ExceptionTest>>('ExceptionTest');
  final exceptionTest = exceptionTestPointer.asFunction<ExceptionTest>();
  final exceptionStructPointer = exceptionTest();
  final exceptionStruct = exceptionStructPointer.ref;
  final exceptionType = exceptionStruct.exceptionType;
  final exceptionMessage = exceptionStruct.message.toDartString();
  print('ExceptionStruct: {$exceptionType, $exceptionMessage}');

  final eitherTestRightPointer = dyLib.lookup<NativeFunction<EitherTestRight>>('EitherTestRight');
  final eitherTestRight = eitherTestRightPointer.asFunction<EitherTestRight>();
  final eitherIntRight = eitherTestRight().ref;
  print('EitherIntRight: {isLeft: ${eitherIntRight.isLeft != 0}, right:${eitherIntRight.right}');

  final eitherTestLeftPointer = dyLib.lookup<NativeFunction<EitherTestLeft>>('EitherTestLeft');
  final eitherTestLeft = eitherTestLeftPointer.asFunction<EitherTestLeft>();
  final eitherIntLeft = eitherTestLeft().ref;
  print('EitherIntLeft: {isLeft: ${eitherIntLeft.isLeft != 0}}');
  final intLeftException = eitherIntLeft.left;
  print('Left: {exceptionType:${intLeftException.exceptionType}, message:${intLeftException.message.toDartString()}');

  final eitherPodTestPointer = dyLib.lookup<NativeFunction<EitherPodTest>>('EitherPodTest');
  final eitherPodTest = eitherPodTestPointer.asFunction<EitherPodTest>();
  final eitherPod = eitherPodTest().ref;
  print('EitherPod: {isLeft: ${eitherPod.isLeft != 0}}');
  print('TestPod: {a:${eitherPod.right.a}, text:${eitherPod.right.text.toDartString()}}');
}

