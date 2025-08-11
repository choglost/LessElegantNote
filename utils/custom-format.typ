// 包含一些自定义的格式

#import "style.typ": 字体,字号

#let hint(body) = {
  set text(font: 字体.楷体)
  // set par(leading: 6pt)
  [#body]
}

#let problem(body) = {
  set text(font: 字体.楷体,rgb("3C71BF"), size: 字号.五号)
  [_题型_：]
  // set par(leading: 6pt)
  set text(font: 字体.楷体,rgb("#737373"))
  [#body]
}


#let redtext(body) = {
  set text(rgb("#c03b3b"))
  // set par(leading: 6pt)
  [#body]
}
