import 'dart:ffi';

import 'package:ffi/ffi.dart';

typedef add_func = Int32 Function(Int32, Int32);
typedef AddFunc = int Function(int, int);
typedef copy_str_func = Pointer<Utf8> Function(Pointer<Utf8>);
typedef CopyStrFunc = Pointer<Utf8> Function(Pointer<Utf8>);

void main(List<String> arguments) {
  final dyLib = DynamicLibrary.open('utils/libutils.so');
  final add = dyLib.lookupFunction<add_func, AddFunc>('add');
  final result = add(40, 2);
  print(result);

  final reverseStr = dyLib.lookupFunction<copy_str_func, CopyStrFunc>('copy_str');
  final hello = 'Тест'.toNativeUtf8();
  final reverseResult = reverseStr(hello);
  print(reverseResult.toDartString());
  malloc.free(hello);
}

