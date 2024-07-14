#import "../lib.typ": documentclass, indent

#let (
  // 布局函数
  twoside, doc,  mainmatter,  appendix, preface,
  // 页面函数
  fonts-display-page, cover, outline-page, 
) = documentclass(
  twoside: false,  // 双面模式，会加入空白页，便于打印

  info: (
    title: ("LessElegantNote: Typst笔记模版"),
    author: "张三",
    submit-date: datetime.today(),
    // cover-image: "",
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
#fonts-display-page()

// 正文部分
#show: mainmatter

= 模版下载与使用
== 模版下载

== 模版使用

= 模版设置说明
== 封面设置

== 文章格式设置
=== 正文格式
=== 标题格式
=== 列表格式

= 写作示例

== 列表

=== 无序列表
// ```Typst
// - 无序列表项一
// - 无序列表项二
//   - 无序子列表项一
//   - 无序子列表项二
// ```

- 无序列表项一
- 无序列表项二
  - 无序子列表项一
  - 无序子列表项二

=== 有序列表

+ 有序列表项一
+ 有序列表项二
  + 有序子列表项一
  + 有序子列表项二

=== 术语列表

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

== 代码块

代码块支持语法高亮。引用时需要加上 `lst:` @lst:code

#figure(
  ```py
  def add(x, y):
    return x + y
  ```,
  caption:[代码块],
) <code>


// 手动分页
// #if twoside {
//   pagebreak() + " "
// }

// 附录
#show: appendix

= 附录

== 子标题

附录内容
