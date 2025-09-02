#import "@preview/i-figured:0.2.4"
#import "../utils/heading.typ": custom-numbering

// 后记，重置 heading 计数器
#let appendix(
  twoside:false,
  numbering: "A.1",
  // figure 计数
  show-figure: i-figured.show-figure.with(numbering: "1.1"),
  // equation 计数
  show-equation: i-figured.show-equation.with(numbering: "(1.1)"),
  // 重置计数
  reset-counter: true,
  it,
) = {
  pagebreak(weak: true)
  set heading(numbering: numbering)

  if reset-counter {
    counter(heading).update(0)
  }
  
  show figure: show-figure // 设置 figure 的编号
  
  show math.equation.where(block: true): show-equation // 设置 equation 的编号

  pagebreak(weak: true, to: if twoside { "odd" })

  it
}