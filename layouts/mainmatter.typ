// 正文设置。在这里修改正文的字体、字号等。

// 第三方包
#import "@preview/i-figured:0.2.4"
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
// 放在其他文件中的小工具
#import "../utils/style.typ": 字号, 字体
#import "../utils/custom-numbering.typ": custom-numbering
#import "../utils/custom-heading.typ": heading-display, active-heading, current-heading
#import "../utils/indent.typ": fake-par
#import "../utils/unpairs.typ": unpairs

#let mainmatter(
  // documentclass 传入参数
  twoside: false,
  info: (:),
  // 其他参数
  theme-color: rgb("3C71BF"), // 主题色，包括标题、strong类型强调的颜色
  // 正文相关
  text-font: 字体.宋体, // 正文字体
  text-size: 字号.五号, // 正文字号
  par-leading: 7pt, // 行距
  par-spacing: 7pt, // 段间距
  strong-font: 字体.宋体, // strong类型字体
  // 标题相关
  numbering-style: "literature", // 标题类型
  heading-font: (字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体), // 标题字体，数组内分别是各级标题
  heading-size: (字号.三号, 字号.四号, 字号.小四, 字号.五号, 字号.五号), // 标题字号
  heading-weight: ("bold", "regular", "regular", "regular", "regular"),// 标题是否加粗
  heading-above: (20pt, 12pt, 9pt, 8pt, 7pt), // 标题上方间距
  heading-below: (20pt, 12pt, 9pt, 8pt, 7pt), // 标题下方间距
  heading-pagebreak: (true, false), // 标题是否换页
  heading-align: (center,auto), // 标题居中
  heading-fill: (black,), // 标题颜色
  ..args,
  it,
) = {
  // 处理 heading- 开头的其他参数
  heading-fill = (theme-color,)
  let heading-text-args-lists = args
    .named()
    .pairs()
    .filter(pair => pair.at(0).starts-with("heading-"))
    .map(pair => (
      pair.at(0).slice("heading-".len()),
      pair.at(1),
    ))

  // 辅助函数
  let array-at(arr, pos) = {
    arr.at(calc.min(pos, arr.len()) - 1)
  }

  // 1. 设置文本和段落样式
  // 1.1 普通文本
  set text(font: text-font, size: text-size)

  set par(leading: par-leading, justify: true, first-line-indent: 2em, spacing: par-spacing)

  // 1.2 特殊类型文本
  // 代码块
  show: codly-init.with()
  codly(display-name: true) // 是否在代码块右上角显示语言名

  // 特殊格式：加粗strong、强调emph、原生raw
  show emph: it => {
    set text(weight: "bold")
    it
  }

  show strong: it => {
    set text(theme-color) // font: strong-font
    it
  }

  show raw: it => {
    set text(font: 字体.等宽) // size: 字号.五号
    it
  }

  // 2. 标题
  // 设置标题的编号numbering
  set heading(numbering: custom-numbering.with(style: info.numbering-style))

  // 设置标题的字体、字号、间距
  show heading: it => {
    set text(
      font: array-at(heading-font, it.level),
      size: array-at(heading-size, it.level),
      weight: array-at(heading-weight, it.level),
      fill: array-at(heading-fill, it.level),
      ..unpairs(heading-text-args-lists.map(pair => (pair.at(0), array-at(pair.at(1), it.level)))),
    )
    set block(above: array-at(heading-above, it.level), below: array-at(heading-below, it.level))
    it
    fake-par // 加入假段落，以实现中文的首行缩进
  }

  // 标题居中与自动换页
  show heading: it => {
    if (array-at(heading-pagebreak, it.level)) {
      // 如果打上了 no-auto-pagebreak 标签，则不自动换页
      if ("label" not in it.fields() or str(it.label) != "no-auto-pagebreak") {
        pagebreak(weak: true)
      }
    }
    if (array-at(heading-align, it.level) != auto) {
      set align(array-at(heading-align, it.level))
    }
    it
  }

  // 3. 列表
  // 3.1 无序列表 list
  // set par(first-line-indent: 0em)
  set list(indent: 2.3em, body-indent: 0.4em) //marker: ("‣","•","-")
  show list: it => {
    set block(above: par-leading, below: par-leading)
    it
    fake-par
  }
  // 3.2 有序列表 enum
  set enum(indent: 2em, body-indent: 0.3em, numbering: "1①i.")
  show enum: it => {
    set block(above: par-leading, below: par-leading)
    it
    fake-par
  }
  // 3.3 术语列表 terms
  set terms(indent: 2em, hanging-indent: 2.2em, separator: " ")
  show terms: it => {
    set block(above: par-leading, below: par-leading)
    it
    fake-par
  }

  // 4. 其他
  // 4.1 图表 figure
  show figure: it => {
    set block(breakable: true) // 设置图表的跨页展示
    it
    fake-par
  }
  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure // figure 的编号

  show figure.where(kind: table): set figure.caption(position: top) // 表格表头置顶
  set figure.caption(separator: "  ") // 表头不用冒号用空格分割
  show figure.caption: set text(font: 字体.宋体, size: 字号.小五) // 表头样式

  // 4.2 表格 table
  set table(align: center + horizon)
  
  // 4.3 数学公式
  // 设置 equation 的编号和假段落首行缩进
  // show math.equation.where(block: true): i-figured.show-equation
  set math.equation(numbering: none)
  show math.equation: it => {
    set text(font: 字体.数学)
    h(0.2em)
    it
    h(0.1em)
  }

  // 4.4 页脚
  // 设置脚注
  show footnote.entry: set text(font: 字体.宋体, size: 字号.五号)

  // 设置页码
  set page(
    footer: context [
      #set align(center)
      #set text(font: 字体.宋体)
      #text(counter(page).display("1"))
    ],
  )
  counter(page).update(1)

  it
}

