MySQL的数据类型大致分为：数值、时间和字符串

bit[(M)]
    二进制位（101001），m表示二进制位的长度（1-64），默认m＝1

tinyint[(m)] [unsigned] [zerofill]
    小整数，数据类型用于保存一些范围的整数数值范围：
    有符号：
        -128 ～ 127.
    无符号：
        0 ～ 255
    特别的： MySQL中无布尔值，使用tinyint(1)构造。

int[(m)][unsigned][zerofill]
    整数，数据类型用于保存一些范围的整数数值范围：
        有符号：
            -2147483648 ～ 2147483647
        无符号：
            0 ～ 4294967295
    特别的：整数类型中的m仅用于显示，对存储范围无限制。例如： int(5),当插入数据2时，select 时数据显示为： 00002

bigint[(m)][unsigned][zerofill]
    大整数，数据类型用于保存一些范围的整数数值范围：
        有符号：
            -9223372036854775808 ～ 9223372036854775807
        无符号：
            0  ～  18446744073709551615

decimal[(m[,d])] [unsigned] [zerofill]
    准确的小数值，m是数字总个数（负号不算），d是小数点后个数。 m最大值为65，d最大值为30。
    特别的：对于精确数值计算时需要用此类型
           decaimal能够存储精确值的原因在于其内部按照字符串存储。

FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]
    单精度浮点数（非准确小数值），m是数字总个数，d是小数点后个数。
        无符号：
            -3.402823466E+38 to -1.175494351E-38,
            0
            1.175494351E-38 to 3.402823466E+38
        有符号：
            0
            1.175494351E-38 to 3.402823466E+38
    **** 数值越大，越不准确 ****

DOUBLE[(M,D)] [UNSIGNED] [ZEROFILL]
    双精度浮点数（非准确小数值），m是数字总个数，d是小数点后个数。
        无符号：
            -1.7976931348623157E+308 to -2.2250738585072014E-308
            0
            2.2250738585072014E-308 to 1.7976931348623157E+308
        有符号：
            0
            2.2250738585072014E-308 to 1.7976931348623157E+308
    **** 数值越大，越不准确 ****

char (m)
    char数据类型用于表示固定长度的字符串，可以包含最多达255个字符。其中m代表字符串的长度。
    PS: 即使数据小于m长度，也会占用m长度

varchar(m)
    varchars数据类型用于变长的字符串，可以包含最多达255个字符。其中m代表该数据类型所允许保存的字符串的最大长度，只要长度小于该最大值的字符串都可以被保存在该数据类型中。

    注：虽然varchar使用起来较为灵活，但是从整个系统的性能角度来说，char数据类型的处理速度更快，有时甚至可以超出varchar处理速度的50%。因此，用户在设计数据库时应当综合考虑各方面的因素，以求达到最佳的平衡

text
    text数据类型用于保存变长的大字符串，可以组多到65535 (2**16 − 1)个字符。

mediumtext
    A TEXT column with a maximum length of 16,777,215 (2**24 − 1) characters.

longtext
    A TEXT column with a maximum length of 4,294,967,295 or 4GB (2**32 − 1) characters.

enum
    枚举类型，
    An ENUM column can have a maximum of 65,535 distinct elements. (The practical limit is less than 3000.)
    示例：
        CREATE TABLE shirts (
            name VARCHAR(40),
            size ENUM('x-small', 'small', 'medium', 'large', 'x-large')
        );
        INSERT INTO shirts (name, size) VALUES ('dress shirt','large'), ('t-shirt','medium'),('polo shirt','small');

set
    集合类型
    A SET column can have a maximum of 64 distinct members.
    示例：
        CREATE TABLE myset (col SET('a', 'b', 'c', 'd'));
        INSERT INTO myset (col) VALUES ('a,d'), ('d,a'), ('a,d,a'), ('a,d,d'), ('d,a,d');

DATE
    YYYY-MM-DD（1000-01-01/9999-12-31）

TIME
    HH:MM:SS（'-838:59:59'/'838:59:59'）

YEAR
    YYYY（1901/2155）

DATETIME

    YYYY-MM-DD HH:MM:SS（1000-01-01 00:00:00/9999-12-31 23:59:59    Y）

TIMESTAMP

    YYYYMMDD HHMMSS（1970-01-01 00:00:00/2037 年某时）
