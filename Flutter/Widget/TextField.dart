const TextField({
  Key key,
  this.controller,    //编辑框的控制器，跟文本框的交互一般都通过该属性完成，如果不创建的话默认会自动创建
  this.focusNode,  //用于管理焦点
  this.decoration = const InputDecoration(),   //输入框的装饰器，用来修改外观
  TextInputType keyboardType,   //设置输入类型，不同的输入类型键盘不一样
  this.textInputAction,   //用于控制键盘动作（一般位于右下角，默认是完成）
  this.textCapitalization = TextCapitalization.none,
  this.style,    //输入的文本样式
  this.textAlign = TextAlign.start,   //输入的文本位置
  this.textDirection,    //输入的文字排列方向，一般不会修改这个属性
  this.autofocus = false,   //是否自动获取焦点
  this.obscureText = false,   //是否隐藏输入的文字，一般用在密码输入框中
  this.autocorrect = true,   //是否自动校验
  this.maxLines = 1,   //最大行
  this.maxLength,   //能输入的最大字符个数
  this.maxLengthEnforced = true,  //配合maxLength一起使用，在达到最大长度时是否阻止输入
  this.onChanged,  //输入文本发生变化时的回调
  this.onEditingComplete,   //点击键盘完成按钮时触发的回调，该回调没有参数，(){}
  this.onSubmitted,  //同样是点击键盘完成按钮时触发的回调，该回调有参数，参数即为当前输入框中的值。(String){}
  this.inputFormatters,   //对输入文本的校验
  this.enabled,    //输入框是否可用
  this.cursorWidth = 2.0,  //光标的宽度
  this.cursorRadius,  //光标的圆角
  this.cursorColor,  //光标的颜色
  this.keyboardAppearance,
  this.scrollPadding = const EdgeInsets.all(20.0),
  this.dragStartBehavior = DragStartBehavior.down,
  this.enableInteractiveSelection,
  this.onTap,    //点击输入框时的回调(){}
  this.buildCounter,
})

InputDecoration({
  this.icon,    //位于装饰器外部和输入框前面的图片
  this.labelText,  //用于描述输入框，例如这个输入框是用来输入用户名还是密码的，当输入框获取焦点时默认会浮动到上方，
  this.labelStyle,  // 控制labelText的样式,接收一个TextStyle类型的值
  this.helperText, //辅助文本，位于输入框下方，如果errorText不为空的话，则helperText不会显示
  this.helperStyle, //helperText的样式
  this.hintText,  //提示文本，位于输入框内部
  this.hintStyle, //hintText的样式
  this.hintMaxLines, //提示信息最大行数
  this.errorText,  //错误信息提示
  this.errorStyle, //errorText的样式
  this.errorMaxLines,   //errorText最大行数
  this.hasFloatingPlaceholder = true,  //labelText是否浮动，默认为true，修改为false则labelText在输入框获取焦点时不会浮动且不显示
  this.isDense,   //改变输入框是否为密集型，默认为false，修改为true时，图标及间距会变小
  this.contentPadding, //内间距
  this.prefixIcon,  //位于输入框内部起始位置的图标。
  this.prefix,   //预先填充的Widget,跟prefixText同时只能出现一个
  this.prefixText,  //预填充的文本，例如手机号前面预先加上区号等
  this.prefixStyle,  //prefixText的样式
  this.suffixIcon, //位于输入框后面的图片,例如一般输入框后面会有个眼睛，控制输入内容是否明文
  this.suffix,  //位于输入框尾部的控件，同样的不能和suffixText同时使用
  this.suffixText,//位于尾部的填充文字
  this.suffixStyle,  //suffixText的样式
  this.counter,//位于输入框右下方的小控件，不能和counterText同时使用
  this.counterText,//位于右下方显示的文本，常用于显示输入的字符数量
  this.counterStyle, //counterText的样式
  this.filled,  //如果为true，则输入使用fillColor指定的颜色填充
  this.fillColor,  //相当于输入框的背景颜色
  this.errorBorder,   //errorText不为空，输入框没有焦点时要显示的边框
  this.focusedBorder,  //输入框有焦点时的边框,如果errorText不为空的话，该属性无效
  this.focusedErrorBorder,  //errorText不为空时，输入框有焦点时的边框
  this.disabledBorder,  //输入框禁用时显示的边框，如果errorText不为空的话，该属性无效
  this.enabledBorder,  //输入框可用时显示的边框，如果errorText不为空的话，该属性无效
  this.border, //正常情况下的border
  this.enabled = true,  //输入框是否可用
  this.semanticCounterText,  
  this.alignLabelWithHint,
})