
来源：《深入理解Java虚拟机：JVM高级特性与最佳实践（第3版）》 <http://www.hzcourse.com/web/refbook/detail/8579/208>

运行示例代码：

```
$ javac -d "target/classes" src/org/fenixsoft/jvm/chapter2/HeapOOM.java
$ java -cp "target/classes" -Xms20m -Xmx20m -XX:+HeapDumpOnOutOfMemoryError org.fenixsoft.jvm.chapter2.HeapOOM
```