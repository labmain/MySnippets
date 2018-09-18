1、alert("要输出的内容");

->在浏览器中弹出一个对话框,然后把要输出的内容展示出来
->alert都是把要输出的内容首先转换为字符串然后在输出的

2、document.write("要输出的内容");

->直接的在页面中展示输出的内容

3、console.log("要输出的内容");

->在控制台输出内容

4、value ->给文本框(表单元素)赋值内容

->获取文本框中(表单元素)的内容

document.getElementById("search").value = "要给#search这个文本框添加的内容";

5、innerHTML/innerText ->给除了表单元素的标签赋值内容

document.getElementById("div1").innerHTML = "吧啦吧啦吧啦吧啦";
document.getElementById("div1").innerText = "吧啦吧啦吧啦吧啦";
