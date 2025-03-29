// 模板示例。包含模板介绍和一些Typst用法。

#import "/less-elegant-note/lib.typ": *

#let (
  // 布局
  doc, // 基本文档设置
  mainmatter, // 正文格式设置
  appendix, // 附录格式设置
  // 页面
  cover, // 封面
  fonts-display-page,// 字体测试页
  outline-page, // 目录页
) = documentclass(
  // 文档信息，会显示在封面
  info: (
    title: ("LessElegantNote：Typst笔记模版"), // 笔记文档的名字
    author: "choglost", // 作者
    date: datetime.today(), // 时间，或者写成 (month:1,day:1,year:2000)
    cover-image: "../example/images/cover.jpg", // 封面图片路径，注意是相对于pages/elgeant-cover.typ的路径
    numbering-style:"maths" // "maths"：数学或论文风格的标题编号 1.1.1  ; "literature"：文学风格的标题编号 第一章/节
  ),
)

#show: doc

#cover() // 显示封面页

#outline-page() // 显示目录页

#fonts-display-page() // 显示字体测试页


#show: mainmatter // 显示正文部分

#heading(numbering:none)[序言] // 序言标题不必编号

== 模版简介
这是一个Typst笔记模板。页面美观，易于自定义。

重要说明：由于社区很活跃，本项目可能由于 Typst 或者第三方包的更新而出现报错，您可以自行更新相关包到最新版本，或者避免使用相关包。

= 模版使用
== 让我们开始！
+ 下载模板
  + 打开本项目的Github页面（https://github.com/choglost/LessElegantNote）。
  + 点击绿色`Code`按钮，下载ZIP压缩包，然后解压到你喜欢的位置。
+ 打开模板
  + 在VSCode中打开整个文件夹，并安装_Tinymist Typst_插件。
  + 打开example/less-elegant-note.typ，按F1使用插件的`Typst Preview`功能，检查能否预览。
+ 使用模版
  + 新建一个文件夹并在VSCode中打开（可取名`mynotes`），把本项目复制到`mynotes`文件夹下，再在`mynotes`下创建一个 `数学.typ` 文件。
  + 参照本文档`less-elegant-note.typ`，编写你自己的笔记。比如可在`数学.typ`内这样写：
```typst
#import "/less-elegant-note/lib.typ": *

#let (
  doc, mainmatter,cover,outline-page,
) = documentclass(
  info: (
    title: ("我的数学笔记"),
    author: "张三",
    date: datetime.today(),
    cover-image: none,
    numbering-style:"maths"
  ),
)

#show: doc
#cover()

#show: mainmatter

= 高数
今天开始学习高数！


```
== 模板自定义设置
=== 封面自定义
=== 文章格式设置
==== 正文格式
==== 标题格式
==== 列表格式

= Typst基本语法

== 列表

=== 无序列表
#grid(
  rows: 2,
  columns: 2,
  gutter: 5pt,
  [代码：], [效果：],
  rect(width: 100%, height: 70pt)[
    ```typst
    - 无序列表项一
    - 无序列表项二
      - 无序子列表项一
      - 无序子列表项二
    ```
  ],
  rect(width: 100%, height: 70pt)[
    - 无序列表项一
    - 无序列表项二
      - 无序子列表项一
      - 无序子列表项二
  ],
)


=== 有序列表
#grid(
  rows: 2,
  columns: 2,
  gutter: 5pt,
  [代码：], [效果：],
  rect(width: 100%, height: 70pt)[
    ```typst
    + 有序列表项一
    + 有序列表项二
      + 有序子列表项一
      + 有序子列表项二
    ```
  ],
  rect(width: 100%, height: 70pt)[
    + 有序列表项一
    + 有序列表项二
      + 有序子列表项一
      + 有序子列表项二
  ],
)

=== 术语列表
#grid(
  rows: 2,
  columns: 2,
  gutter: 5pt,
  [代码：], [效果：],
  rect(width: 100%, height: 40pt)[
    ```typst
    / 术语一: 术语解释
    / 术语二: 术语解释
    ```
  ],
  rect(width: 100%, height: 40pt)[
    / 术语一: 术语解释
    / 术语二: 术语解释
  ],
)




== 图表

// 引用@tbl:timing，引用@tbl:timing-tlt，以及@fig:cover。引用图表时，表格和图片分别需要加上 `tbl:`和`fig:` 前缀才能正常显示编号。

=== 常规表
#grid(
  rows: 2,
  columns: 2,
  gutter: 5pt,
  [代码：], [效果：],
  rect(width: 100%, height: 120pt)[
    ```typst
    #figure(
      table(
        columns: 4,
        [t], [1], [2], [3],
        [y], [0.3s], [0.4s], [0.8s],
      ), caption: [常规表],
    )
    ```
  ],
  rect(width: 100%, height: 120pt)[
    #figure(
      table(
        columns: 4,
        [t], [1], [2], [3],
        [y], [0.3s], [0.4s], [0.8s],
      ),
      caption: [常规表],
    )
  ],
)

=== 三线表
#grid(
  rows: 2,
  columns: 2,
  gutter: 5pt,
  [代码：], [效果：],
  rect(width: 100%, height: 160pt)[
    ```typst
    #figure(
      table(
        columns: 4,
        stroke: none,
        table.hline(),
        [t], [1], [2], [3],
        table.hline(stroke: .5pt),
        [y], [0.3s], [0.4s], [0.8s],
        table.hline(),
      ), caption: [三线表],
    )
    ```
  ],
  rect(width: 100%, height: 160pt)[
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
    )
  ],
)

=== 图片
#grid(
  rows: 2,
  columns: 2,
  gutter: 5pt,
  [代码：], [效果：],
  rect(width: 100%, height: 110pt)[
    ```typst
    #figure(
      image("images/cover.jpg", width: 40%),
      caption: [图片],
    )
    ```
  ],
  rect(width: 100%, height: 110pt)[
    #figure(
      image("images/cover.jpg", width: 40%),
      caption: [图片],
    )
  ],
)

== 数学公式
=== 行内、行间公式
#grid(
  rows: 2,
  columns: 2,
  gutter: 5pt,
  [代码：], [效果：],
  rect(width: 100%, height: 70pt)[
    ```typst
    可以写行内公式 $x + y$，

    也可以写行间公式
    $ phi.alt := (1 + sqrt(5)) / 2 $
    ```
  ],
  rect(width: 100%, height: 70pt)[
    可以写行内公式 $x + y$，

    也可以写行间公式
    $ phi.alt := (1 + sqrt(5)) / 2 $
  ],
)

=== 上下标
#grid(
  rows: 2,
  columns: 2,
  gutter: 5pt,
  [代码：], [效果：],
  rect(width: 100%, height: 140pt)[
    ```typst
    $accent(a, `)$\
    $lim_(n->infinity) x_n=a$\
    $limits(lim)_(n->infinity) x_n=a$\
    $ attach(
        Pi, t: alpha, b: beta,
        tl: 1, tr: 2+3, bl: 4+5, br: 6,
      ) $\
    $ binom(n, k) $
    ```
  ],
  rect(width: 100%, height: 140pt)[
    $accent(a, `)$\
    $lim_(n->infinity) x_n=a$\
    $limits(lim)_(n->infinity) x_n=a$\
    $
      attach(
      Pi, t: alpha, b: beta,
      tl: 1, tr: 2+3, bl: 4+5, br: 6,
    )
    $\
    $ binom(n, k) $
  ],
)

=== 矩阵和向量

=== 常用符号
#grid(
  rows: 2,
  columns: 2,
  gutter: 5pt,
  [代码：], [效果：],
  rect(width: 100%, height: 140pt)[
    ```typst
    单箭头：$->,<-,<->$\
    双箭头：$=>,arrow.l.double,arrow.l.r.double$\
    等号：$=,>=,<=,!=,tilde.eq,tilde.equiv$
    ```
  ],
  rect(width: 100%, height: 140pt)[
    单箭头：$->,<-,<->$\
    双箭头：$=>,arrow.l.double,arrow.l.r.double$\
    等号：$=,>=,<=,!=,tilde.eq,tilde.equiv$
  ],
)

== 定理环境
#show: thmrules


#grid(
  rows: 2,
  columns: 2,
  gutter: 5pt,
  [代码：], [效果：],
  rect(width: 100%, height: 400pt)[
    ```typst
    #theorem(number: "1.1",title: "title")[
      #lorem(5)
    ] <thm1>

    #proof[ It's used to prove @thm1. ]
    
    #definition[
      #lorem(5)
      #remark[#lorem(5)]
    ]
    
    #lemma[
      If ..., then
      + #lorem(5).
      + #lorem(5).
    ]

    #example[ #lorem(5) ]

    #proof[ #lorem(5) ]

    #exercise[
      #lorem(5)\ 
      #solution[ #lorem(5) ]
    ]

    #corollary[ #lorem(5) ]
    ```
  ],
  rect(width: 100%, height: 400pt)[
    #theorem("title")[
      #lorem(5)
    ] <thm1>

    #proof[ It's used to prove @thm1. ]
    
    #definition("123")[
      #lorem(5)
      #remark[#lorem(5)]
    ]
    
    #lemma[
      If ..., then
      + #lorem(5).
      + #lorem(5).
    ]

    #example[ #lorem(5) ]

    #proof[ #lorem(5) ]

    #exercise[
      #lorem(5)\ 
      #solution[ #lorem(5) ]
    ]

    #corollary[ #lorem(5) ]
  ],
)





== 代码块

// 代码块支持语法高亮。引用时需要加上 `lst:` @lst:code

#grid(
  rows: 2,
  columns: 2,
  gutter: 5pt,
  [代码：], [效果：],
  rect(width: 100%, height: 60pt)[
    ````typst
    ```py
    def add(x, y):
      return x + y
    ```
    ````
  ],
  rect(width: 100%, height: 60pt)[
    ````typst
    ```py
    def add(x, y):
      return x + y
    ```
    ````
  ],
)

// 手动分页
// #if twoside {
//   pagebreak() + " "
// }

= 注意点
== 个人总结的几条原则
+ 减少四级或更深标题的使用，只有当三级标题下的内容有明显分类，各自有小点时才使用四级标题；否则使用的无序列表形式
+ 减少有序列表使用，四级标题下，且仍有标序号的必要时（对数量或次序重视），才使用有序列表。或者起到充当五级标题的作用，以符合第一条原则。
+ 不使用有序、无序列表的互相嵌套
// 示例：

// *资本的原始积累*：
// - _概念_：资本原始积累就是以暴力手段使生产者与生产资料相分离，资本迅速集中于少数人手中，资本主义得以迅速发展的历史过程。
// - _途径_：一是用暴力手段剥夺农民土地； 二是用暴力手段掠夺货币财富，即利用国家政权的力量进行残酷的殖民掠夺。


// 附录
#show: appendix

= 附录

== 导入的第三方包
+ outrageous:0.4.0 (https://typst.app/universe/package/outrageous) 显示目录
+ cuti:0.3.0 中文字体加粗
+ ctheorem  定理环境

\ \ \ \ 
其他附录内容
