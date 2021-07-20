import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'exception_struct.dart';

// typedef add_func = Int32 Function(Int32, Int32);
// typedef AddFunc = int Function(int, int);
// typedef copy_str_func = Pointer<Utf8> Function(Pointer<Utf8>);
// typedef CopyStrFunc = Pointer<Utf8> Function(Pointer<Utf8>);
// typedef free_buf_func = Void Function(Pointer<Utf8>);
// typedef FreeBufFunc = void Function(Pointer<Utf8>);
typedef ExceptionTestNative = ExceptionStruct Function();
typedef ExceptionTest = ExceptionStruct Function();

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

  final exceptionTest = dyLib.lookupFunction<ExceptionTestNative, ExceptionTest>('ExceptionTest');
  final exceptionStruct = exceptionTest();
  final exceptionType = exceptionStruct.exceptionType.value;
  final exceptionMessage = exceptionStruct.message.toDartString();
  print('ExceptionStruct: {$exceptionType, $exceptionMessage}');
}

