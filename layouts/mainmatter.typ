#import "@preview/i-figured:0.2.4"
#import "@preview/codly:0.2.1": *

#import "../utils/style.typ": 字号, 字体
#import "../utils/custom-numbering.typ": custom-numbering
#import "../utils/custom-heading.typ": heading-display, active-heading, current-heading
#import "../utils/indent.typ": fake-par
#import "../utils/unpairs.typ": unpairs


#let mainmatter(
  // documentclass 传入参数
  twoside: false,
  info :(:),
  // 其他参数
  theme-color: rgb("3C71BF"),// 主题色，包括标题、strong类型强调的颜色
  // 正文相关
  text-font: 字体.宋体,
  text-size: 字号.五号,
  par-leading: 0.7em,// 行距
  par-spacing: 0.7em,// 段间距
  // 特殊类型文本
  strong-font: 字体.黑体,

  // 标题相关
  heading-font: (字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体),// 标题字体
  heading-size: (字号.三号, 字号.四号, 字号.五号, 字号.五号),
  heading-weight: ("regular", "regular", "regular", ),
  heading-above: (2em, 1.5em, 1em, 0.7em),
  heading-below: (2em, 1.5em, 1em, 0.7em),  // 标题下方
  heading-pagebreak: (true, false), // 标题换页
  heading-align: (center, auto),  // 标题居中
  heading-fill: (black,), // 标题颜色
  // 页眉相关
  header-render: auto,
  display-header: false,
  skip-on-first-level: true,
  stroke-width: 0.5pt,
  reset-footnote: false,

  ..args,
  it,
) = {
  // 默认参数
  info = (
    numbering-style: "literature",
  ) + info
  // 处理 heading- 开头的其他参数
  heading-fill = (theme-color,)
  let heading-text-args-lists = args.named().pairs().filter(pair => pair.at(0).starts-with("heading-")).map(pair => (
    pair.at(0).slice("heading-".len()),
    pair.at(1),
  ))

  // 辅助函数
  let array-at(arr, pos) = {
    arr.at(calc.min(pos, arr.len()) - 1)
  }

  // 文本和段落样式
  set text(font: text-font, size: text-size)

  set par(leading: par-leading, justify: true, first-line-indent: 2em)
  show par: set block(spacing: par-spacing)

  // 特殊类型文本
  // 代码块

  show: codly-init.with()
  codly(display-name: false)

  // set block(width: 60%)
  show raw: it => {
    set text(font: 字体.等宽)
    
    it
  }

  show emph: it => {
    set text(weight: "bold")
    // show: show-cn-fakebold // 伪加粗
    it
  }

  show strong: it => {
    set text(font: strong-font, theme-color)
    it
  }

  // 设置脚注
  show footnote.entry: set text(font: 字体.宋体, size: 字号.五号)
  // 设置 equation 的编号和假段落首行缩进
  show math.equation.where(block: true): i-figured.show-equation
  // 设置 figure 的编号，表格表头置顶 + 不用冒号用空格分割 + 样式
  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure
  show figure.where(kind: table): set figure.caption(position: top)
  set figure.caption(separator: "  ")
  show figure.caption: set text(font: 字体.宋体, size: 字号.小五)

  // 处理标题
  // 设置标题的 numbering
  set heading(numbering: custom-numbering.with(style: info.numbering-style))
  // counter(heading).update(0)
  show heading: it => {
    // 设置字体字号
    set text(
      font: array-at(heading-font, it.level),
      size: array-at(heading-size, it.level),
      weight: array-at(heading-weight, it.level),
      fill: array-at(heading-fill, it.level),
      ..unpairs(heading-text-args-lists.map(pair => (pair.at(0), array-at(pair.at(1), it.level)))),
    )
    set block(above: array-at(heading-above, it.level), below: array-at(heading-below, it.level))
    it
    fake-par //加入假段落模拟首行缩进
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
      it
    } else {
      it
    }
  }

  // 处理列表
  // 无序列表 list
  set list(indent: 1.3em, body-indent: 0.4em) //marker: ("•","·")
  show list: it => {
    set block(above: 0.7em, below: 0.7em)
    it
    fake-par
  }
  // 有序列表 enum
  set enum(indent: 0.8em, body-indent: 0.4em, numbering: "1.")
  show enum: it => {
    set block(above: 0.7em, below: 0.7em)
    it
    fake-par
  }
  // 术语列表 terms
  set terms(indent: 0em, hanging-indent: 2.65em)
  show terms: it => {
    set block(above: 0.7em, below: 0.7em)
    it
    fake-par
  }

  // 表格
  set table(align: center + horizon)

  // 处理页眉
  set page(..(
    if display-header {
      (
        header: {
          // 重置 footnote 计数器
          if reset-footnote {
            counter(footnote).update(0)
          }
          locate(loc => {
            // 5.1 获取当前页面的一级标题
            let cur-heading = current-heading(level: 1, loc)
            // 5.2 如果当前页面没有一级标题，则渲染页眉
            if not skip-on-first-level or cur-heading == none {
              if header-render == auto {
                // 一级标题和二级标题
                let first-level-heading = if not twoside or calc.rem(loc.page(), 2) == 0 {
                  heading-display(active-heading(level: 1, loc))
                } else {
                  ""
                }
                let second-level-heading = if not twoside or calc.rem(loc.page(), 2) == 2 {
                  heading-display(active-heading(level: 2, prev: false, loc))
                } else {
                  ""
                }
                set text(font: 字体.楷体, size: 字号.五号)
                stack(
                  first-level-heading + h(1fr) + second-level-heading,
                  v(0.25em),
                  if first-level-heading != "" or second-level-heading != "" {
                    line(length: 100%, stroke: stroke-width + black)
                  },
                )
              } else {
                header-render(loc)
              }
              v(0em) // header-vspace
            }
          })
        },
      )
    } else {
      (
        header: {
          // 重置 footnote 计数器
          if reset-footnote {
            counter(footnote).update(0)
          }
        },
      )
    }
  ))

  // 处理页脚的页码
  set page(footer: [
    #align(center)[
      #text(counter(page).display("1"))
    ]
  ])
  counter(page).update(1)



  it
}