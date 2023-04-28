/*
 * dart 数据类型（num, int, double, bool, String, List, Set, Map, Object, dynamic, 数据类型转换与判断，可空类型）
 */

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DartDatatype extends StatelessWidget {
  const DartDatatype({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 数字类型（int 和 double），布尔类型（bool）
    sample1();
    // 字符串类型（String）
    sample2();
    // List 类型
    sample3();
    // Set 类型
    sample4();
    // Map 类型
    sample5();
    // Object 和 dynamic
    sample6();
    // 数据类型的转换，判断，获取
    sample7();
    // 可空类型
    sample8();

    return const MyWidget(text: "dart_datatype");
  }

  void sample1() {
    // int 类型
    var a = 1;
    var b = 0x61;

    // double 类型
    var c = 1.23;
    var d = 1.23e4;   // 12300.0
    var e = 1.23e-4;  // 0.000123

    // int 和 double 的基类是 num
    num f = 1;  // f 是 int 类型
    log(f.runtimeType.toString()); // int
    f += 1.23;  // f 会自动转换为 double 类型
    log(f.runtimeType.toString()); // double

    // String 转 int
    var g = int.parse('123');
    // String 转 double
    var h = double.parse('3.14');
    // double 转 int
    var i = 3.14.toInt();

    // bool 类型
    var j = true;

    log("$a, $b, $c, $d, $e, $f, $g, $h, $i, $j");
  }

  void sample2() {
    // String 类型，可以用 "" 或 ''
    var a = "aaa";
    var b = 'bbb';
    var c = 'a\nb\nc';

    // 通过 r 创建的字符串，转义符无效
    var d = r'a\nb\nc';
    // 相邻的多个字符串会自动拼接（不需要使用 + 拼接）。下面变量 e 的结果为 abc
    var e = 'a'   'b'
        'c';
    // 通过 '''''' 或 """""" 定义多行字符串（换行和空格等都会被保留）
    var f = '''a
 b
c''';

    // 字符串的相等判断
    var g = a == b;
    // 字符串拼接（通过 +），字符串模板（通过 $variableName 或 ${expression}）
    var h = a + b + "$a${a + b}";

    // num 转 String
    var i = 3.1415926.toString();         // 3.1415926
    // 保留 2 为小数
    var j = 3.1415926.toStringAsFixed(2); // 3.14

    // ascii 转字符串
    var k = String.fromCharCode(0x61);                    // a
    // unicode 转字符串
    var l = String.fromCharCodes(Runes('\u738b\u738b'));  // 王王

    // 字符串可以和一个整型做乘法，用于指定字符串的重复次数
    var m = "abc" * 3;  // abcabcabc

    log("$a, $b, $c, $d, $e, $f, $g, $h, $i, $j, $k, $l, $m");
  }

  void sample3() {
    // List 是有序列表，元素是可重复的
    // 下面的 a 会被推导为 List<int> 类型，如果需要创建一个空列表则类似这么写 var x = <int>[];
    // 如果通过 var x = []; 创建空数组的话，其类型为 List<dynamic>
    var a = [1, 2]; // 写全了就是 <int>[1, 2]
    // 添加一个元素
    a.add(0);
    // 添加多个元素
    a.addAll([4, 5]);
    // 获取或设置指定位置的元素
    a[2] = 3;                 // [1, 2, 3, 4, 5]
    var b = a[a.length - 1];  // 5

    // 通过 ... 拼接多个 List（...后的变量不能为 null）
    var c = [1, 1, ...a];     // [1, 1, 1, 2, 3]
    List<int>? d;
    // 通过 ...? 拼接多个 List（...后的变量可以为 null）
    var e = [...c, ...?d];    // [1, 1, 1, 2, 3]

    // 构造 List 的时候支持 if 语句
    var f = [1, 2, 3, if (c.length > 1) 4]; // [1, 2, 3, 4]
    // 构造 List 的时候支持 for 语句
    var g = ['a0', for (var v in f) 'a$v']; // [a0, a1, a2, a3, a4]
    var g2 = ['a0', for (var i = 0; i < f.length; i++) 'a${f[i]}']; // [a0, a1, a2, a3, a4]

    var h = [1, 2, 3];
    var i = h.toList(); // 通过 toList() 复制列表
    var j = h == i;     // h 和 i 是不同的对象

    // 通过 whereType<T>() 按类型过滤列表
    var k = [1, 'a', 2, 'b', 3];
    var l = k.whereType<int>().toList(); // [1, 2, 3]

    var m = [1, 2, 3, 4, 5, 6];     // [1, 2, 3, 4, 5, 6]
    // where - 返回符合指定条件的元素（返回的是 Iterable<E> 类型的数据）
    var n = m.where((element) {     // [4, 5, 6]
      return element > 3;
    }).toList();
    // any - 是否至少有一个元素符合指定的条件
    var o = m.any((element) {       // true
      return element > 3;
    });
    // every - 是否每个元素都符合指定的条件
    var p = m.every((element) {     // false
      return element > 3;
    });
    // map - 处理每个元素后再放入新的集合（返回的是 Iterable<E> 类型的数据）
    // 注：下面这句写全了应该是 m.map<String>(...) 其中的 String 代表处理后的元素的类型
    var q = m.map((e) {             // [element:1, element:2, element:3, element:4, element:5, element:6]
      return 'element:$e';
    }).toList();

    // Uint8List 相当于 java 的 byte[]
    var r = Uint8List.fromList([1, 2, 3]);    // [1, 2, 3]
    // Int32List 相当于 java 的 int[]
    var s = Int32List.fromList([1, 2, 3]);    // [1, 2, 3]
    // Int64List 相当于 java 的 long[]
    var t = Int64List.fromList([1, 2, 3]);    // [1, 2, 3]
    // Float64List 相当于 java 的 double[]
    var u = Float64List.fromList([1, 2, 3]);  // [1.0, 2.0, 3.0]

    log("$a, $b, $c, $d, $e, $f, $g, $g2, $j, $k, $l, $m, $n, $o, $p, $q, $r, $s, $t, $u");
  }

  void sample4() {
    // Set 是无序集合，元素是不可重复的
    // 下面的 a 会被推导为 Set<int> 类型，如果需要创建一个空集合则类似这么写 var x = <int>{};
    var a = {'a', 'b', 'c', }; // 写全了就是 <String>{'a', 'b', 'c', }
    // 添加一个元素
    a.add('c');
    a.add('d');   // {a, b, c, d}

    // 定义一个 String 类型的空 Set
    var b = <String>{};
    b.add("d");
    b.add("e");
    // 拼接多个 Set
    b.addAll(a);  // {d, e, a, b, c}

    /// Set 也支持 ... 和 ...? 以及 if 和 for，详见 List 中的说明

    log("$a, $b");
  }

  void sample5() {
    // Map 是字典表
    // 下面的 a 会被推导为 Map<String, String> 类型，，如果需要创建一个空字典则类似这么写 var x = <String, String>{};
    var a = {'k1': 'v1', 'k2': 'v2', }; // 写全了就是 <String, String>{'k1': 'v1', 'k2': 'v2', }
    a['k2'] = "v222";                         // 有则更新
    a['k3'] = 'v3';                           // 无则添加
    var b = a.putIfAbsent("k4", () => "v4");  // 有则返回，无则添加并返回
    var c = a["k5"];                          // 如果尝试获取不存在的 key 则返回 null

    // 遍历字典表
    for (var k in a.keys) {
      log("key:$k, value:${a[k]}");
    }

    // 定义一个空字典，其类型为 Map<dynamic, dynamic>
    var d = {};
    d[123] = "abc";
    d["abc"] = "123";

    log("$a, $b, $c, $d"); // {k1: v1, k2: v222, k3: v3, k4: v4}, v4, null, {123: abc, abc: 123}
  }

  void sample6() {
    // Object 是除了 null 之外所有类的基类
    Object a = "a";
    // a = 123;                         // Object 变量的类型定了就不能改了，这样会运行时报错的
    // var aLength = a.length;          // String 类型有 length 属性，但是这样做会编译时报错的，因为是用 Object 声明的 a
    var aLength = (a as String).length; // 需要先将 a 转换为 String 类型才可以

    // dynamic 是动态类型，在运行时才能知道具体类型
    dynamic b = 123;
    var c = b.runtimeType;              // b 的数据类型是 int
    b = "b";                            // 可以修改 dynamic 声明的变量的数据类型
    var d = b.runtimeType;              // b 的数据类型是 String
    var bLength = b.length;             // 因为在编译时确定具体类型，所以这样写是正确的（如果你调用了具体类型不存在的属性或方法，则在运行时报错）

    log("$a, $aLength, $b, $bLength, $c, $d");  // a, 1, b, 1, int, String
  }

  void sample7() {
    Object a = "abc";                 // abc
    // 通过 as 转换数据类型
    String b = a as String;           // abc
    // 通过 is 判断数据类型
    var c = b is String;              // true
    // 通过 runtimeType 获取数据类型
    var d = b.runtimeType.toString(); // String

    var e = <dynamic>[1, 2, 3];
    var f = e.cast<int>();      // 不建议用 cast<T>() 转换列表的数据类型
    var g = List<int>.from(e);  // 推荐通过 List<T>.from() 转换列表的数据类型
    for (final item in e) {
      var x = item as int;      // 在访问的时候转换数据类型也是被推荐的做法
    }

    Object o1 = _MyModel("abc", 12);
    Object o2 = _MyModel("abc", 12);
    // 判断两个对象是否相等（通过对象的 == 运算符判断）
    var h = o1 == o2;             // true
    // 判断两个引用是否指向同一个对象（类似于指针判断）
    var i = identical(o1, o2);    // false

    Object j = "webabcd";
    // 判断类型成功之后，再使用时其就是被转换之后的
    if (j is String) {
      log("${j.length}");
    }
    // 判断类型成功之后，再使用时其就是被转换之后的
    if (j is String && j.length == 7) {
      log("ok");
    }

    Object k = "webabcd";
    // 看下面的示例，一旦你 as 转换了，则之后再使用时其就是被转换之后的
    var l = k as String;
    var m = k.length;

    log("$a, $b, $c, $d, $h, $i, $h ,$i");
  }

  void sample8() {
    // 通过 ? 可以声明可空类型（即允许不初始化），默认值为 null
    String? a;
    int? b;

    // ? 左侧是 null 则返回 null
    var c = a?.length;

    try {
      // ! 左侧是 null 则抛出异常
      var d = a!.length;
    } catch (e) {
      log("$e");
    }

    a = "abc";
    // ? 左侧不是 null 则与无 ? 时逻辑相同
    var e = a?.length;
    // ! 左侧不是 null 则与无 ! 时逻辑相同
    var f = a!.length;

    String? g = currentTimestamp() % 999999 == 0 ? null : "webabcd";
    // 判断为非空之后，再使用时其就是非空了
    if (g != null) {
      log("${g.length}");
    }
    // 判断为非空之后，再使用时其就是非空了
    if (g != null && g.length == 7) {
      log("ok");
    }

    String? h = currentTimestamp() % 999999 == 0 ? null : "webabcd";
    // 看下面的示例，一旦你 ! 了一个可空类型，则之后再使用时其就是非空了
    var i = h!.length;
    var j = h.length;

    log("$a, $b, $c, $e, $f"); // abc, null, null, 3, 3
  }
}

class _MyModel {
  String name;
  int age;
  _MyModel(this.name, this.age);

  /// 重写 == 运算符
  /// 注：如果重写 == 运算符，则建议也要重写 hashCode，以便确保 == 的两个对象，他们的 hashCode 也是相等的
  @override
  bool operator ==(Object other) {
    return other is _MyModel && name == other.name && other.age == other.age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}