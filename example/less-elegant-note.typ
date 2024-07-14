#import "../lib.typ": *

#let (
  // 布局函数
  twoside, doc,  mainmatter,  appendix, preface,
  // 页面函数
  fonts-display-page, cover, outline-page, 
) = documentclass(
  twoside: false,  // 双面模式，会加入空白页，便于打印

  info: (
    title: ("LessElegantNote：一个Typst笔记模版"),
    author: "IxionWheel",
    submit-date: datetime.today(),
    cover-image: "../example/images/cover.jpg", // 封面图片路径，注意是相对于pages/elgeant-cover.typ的路径
    numbering-style:"maths" // "maths"：数学或论文风格的标题编号 | "literature"：文学风格的标题编号
  ),
)

// 文稿设置
#show: doc

// 封面页
#cover()

// 前言部分
#show: preface

// 目录
#outline-page()

// 字体显示测试页
// #fonts-display-page()

// 正文部分
#show: mainmatter


= 模版简介
本项目是一个Typst笔记模板。
== 模版下载
+ 打开项目Github页面（https://github.com/IxionWheel/LessElegantNote）。
+ 点击绿色Code按钮，下载ZIP压缩包。
+ 解压到你喜欢的位置。
+ 在vscode中_打开整个文件夹_，并安装_Tinymist Typst_插件。
+ 打开example/less-elegant-note.typ，检查能否预览。
== 模版使用
+ 参照less-elegant-note.typ，编写你自己的笔记。
+ 例如可在LessElegantNote下新建一个mynotes文件夹，在其中新建一个 数学.typ 文件，并输入如下基础内容。

```typst
#import "../lib.typ": *

#let (
  // 布局函数
  twoside, doc,  mainmatter,  appendix, preface,
  // 页面函数
  fonts-display-page, cover, outline-page, 
) = documentclass(
  twoside: false,  // 双面模式，会加入空白页，便于打印
  info: (
    title: ("数学笔记"),
    author: "张三",
    submit-date: datetime.today(),
    cover-image: "", // 封面图片路径，注意是相对于pages/elgeant-cover.typ的路径
    numbering-style:"maths" // "maths"：数学或论文风格的标题编号 | "literature"：文学风格的标题编号
  ),
)
// 文稿设置
#show: doc

#cover()// 封面页

// 前言部分
#show: preface

#outline-page()// 目录

// 正文部分
#show: mainmatter

= 章节标题

== 子标题

正文内容
```

= 模版设置说明
== 封面设置

== 文章格式设置
=== 正文格式
=== 标题格式
=== 列表格式

= 写作示例

== 列表

=== 无序列表
```typst
- 无序列表项一
- 无序列表项二
  - 无序子列表项一
  - 无序子列表项二
```

- 无序列表项一
- 无序列表项二
  - 无序子列表项一
  - 无序子列表项二

=== 有序列表
```typst
+ 有序列表项一
+ 有序列表项二
  + 有序子列表项一
  + 有序子列表项二
```
+ 有序列表项一
+ 有序列表项二
  + 有序子列表项一
  + 有序子列表项二

=== 术语列表
```typst
/ 术语一: 术语解释
/ 术语二: 术语解释
```
/ 术语一: 术语解释
/ 术语二: 术语解释

== 图表

引用@tbl:timing，引用@tbl:timing-tlt，以及@fig:cover。引用图表时，表格和图片分别需要加上 `tbl:`和`fig:` 前缀才能正常显示编号。

#align(center, (stack(dir: ltr)[
  #figure(
    table(
      align: center + horizon,
      columns: 4,
      [t], [1], [2], [3],
      [y], [0.3s], [0.4s], [0.8s],
    ),
    caption: [常规表],
  ) <timing>
][
  #h(50pt)
][
  #figure(
    table(
      columns: 4,
      stroke: none,
      table.hline(),
      [t], [1], [2], [3],
      table.hline(stroke: .5pt),
      [y], [0.3s], [0.4s], [0.8s],
      table.hline(),
    ),
    caption: [三线表],
  ) <timing-tlt>
]))

#figure(
  image("images/cover.jpg", width: 20%),
  caption: [图片测试],
) <cover>


== 数学公式

可以像 Markdown 一样写行内公式 $x + y$，以及带编号的行间公式：

$ phi.alt := (1 + sqrt(5)) / 2 $ <ratio>

引用数学公式需要加上 `eqt:` 前缀，则由@eqt:ratio，我们有：

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

我们也可以通过 `<->` 标签来标识该行间公式不需要编号

$ y = integral_1^2 x^2 dif x $ <->

而后续数学公式仍然能正常编号。

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

== 定理环境
#show: thmrules.with(qed-symbol: $square$)

#theorem("Euclid")[
  There are infinitely many primes.
]

#definition[
  A natural number is called a #highlight[_prime number_] if it is greater
  than 1 and cannot be written as the product of two smaller natural numbers.
]

#example[
  The numbers $2$, $3$, and $17$ are prime.
  @cor_largest_prime shows that this list is not exhaustive!
]

#proof[
  Suppose to the contrary that $p_1, p_2, dots, p_n$ is a finite enumeration
  of all primes. Set $P = p_1 p_2 dots p_n$. Since $P + 1$ is not in our list,
  it cannot be prime. Thus, some prime factor $p_j$ divides $P + 1$.  Since
  $p_j$ also divides $P$, it must divide the difference $(P + 1) - P = 1$, a
  contradiction.
]

#corollary[
  There is no largest prime number.
] <cor_largest_prime>

#corollary[
  There are infinitely many composite numbers.
]

#theorem[
  There are arbitrarily long stretches of composite numbers.
]

#proof[
  For any $n > 2$, consider $
    n! + 2, quad n! + 3, quad ..., quad n! + n 
  $
]


== 代码块

// 代码块支持语法高亮。引用时需要加上 `lst:` @lst:code

````typst
```py
def add(x, y):
  return x + y
```
````




// #figure(
//   ```py
//   def add(x, y):
//     return x + y
//   ```,
//   caption:[代码块],
// ) <code>


// 手动分页
// #if twoside {
//   pagebreak() + " "
// }

// 附录
#show: appendix

= 附录

== 子标题

附录内容
