/*
 * dart 数据类型（num, int, double, bool, String, List, Set, Map, Object, dynamic, 数据类型转换与判断，可空类型）
 */

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

    // bool 类型
    var i = true;

    log("$a, $b, $c, $d, $e, $f, $g, $h, $i");
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

    log("$a, $b, $c, $d, $e, $f, $g, $h, $i, $j, $k, $l");
  }

  void sample3() {
    // List 是有序列表，元素是可重复的
    // 下面的 a 会被推导为 List<int> 类型，如果需要创建一个空列表则类似这么写 var x = <int>[];
    // 如果通过 var x = []; 创建空数组的话，其类型为 List<dynamic>
    var a = [1, 2];
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

    log("$a, $b, $c, $d, $e, $f, $g, $g2, $j, $k, $l");
  }

  void sample4() {
    // Set 是无序集合，元素是不可重复的
    // 下面的 a 会被推导为 Set<int> 类型，如果需要创建一个空集合则类似这么写 var x = <int>{};
    var a = {'a', 'b', 'c', };
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
    var a = {
      'k1': 'v1',
      'k2': 'v2',
    };
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
    b = "b";                            // 可以修改 dynamic 声明的变量的数据类型
    var bLength = b.length;             // 因为在编译时确定具体类型，所以这样写是正确的（如果你调用了具体类型不存在的属性或方法，则在运行时报错）

    log("$a, $aLength, $b, $bLength");
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

    log("$a, $b, $c, $d");
  }

  void sample8() {
    // 通过 ? 可以声明可空类型（即允许不初始化），默认值为 null
    String? a;
    int? b;

    log("$a, $b"); // null, null
  }
}
