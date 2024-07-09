#import "../utils/datetime-display.typ": datetime-display
#import "../utils/style.typ": 字号, 字体

#let simple-cover(
  // documentclass 传入的参数
  twoside: false,
  fonts: (:),
  info: (:),
  datetime-display: datetime-display,
) = {
  // 1.  默认参数
  fonts = 字体 + fonts
  info = (
    // title: ("基于Typst的笔记模版"),
    // author: "张三",
    date: datetime.today(),
    cover-image: "../assets/cover.png",
  ) + info

  // 2.  对参数进行处理
  // 处理提交日期
  if type(info.date) == datetime {
    info.date = datetime-display(info.date)
  }
  // // 如果是字符串，则使用换行符将标题分隔为列表
  if type(info.title) == str {
    info.title = info.title.split("\n")
  }

  // 3.  正式渲染  
  // pagebreak(weak: true, to: if twoside { "odd" })
  
  set page(margin: 0pt)

  if info.cover-image != "" {
    image(info.cover-image, width: 100%,height:50%)
    v(40pt)
  }else{
    // set align(left + horizon)
    v(380pt)
  }

  for s in range(info.title.len()) {
    text(font: fonts.宋体, size:字号.一号)[#h(50pt)*#info.title.at(s)*]
    v(0pt)
  }
  
  v(20pt)
  text(font: fonts.仿宋, size:字号.四号)[#h(50pt)作者：#info.author]
  v(0pt)
  text(font: fonts.仿宋, size: 字号.四号)[#h(50pt)日期：#info.date]

}