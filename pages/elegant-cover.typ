#import "../utils/style.typ": 字号, 字体

#let elegant-cover(
  // documentclass 传入的参数
  twoside: false,
  info: (:),
  // datetime-display: datetime-display,
) = {
  // 1.  默认参数
  info = (
    title: ("LessElegantNote\n一个Typst笔记模版"),
    author: "张三",
    date: datetime.today(),
    cover-image: "",
  ) + info

  // 2.  对参数进行处理
  // 处理提交日期
  if type(info.date) == datetime {
    info.date = info.date.display("[year]/[month]/[day]") //[year]年[month]月[day]日
  }
  // // 如果是字符串，则使用换行符将标题分隔为列表
  if type(info.title) == str {
    info.title = info.title.split("\n")
  }

  // 3.  正式渲染
  // pagebreak(weak: true, to: if twoside { "odd" })

  set page(margin: 0pt)

  if info.cover-image != "" {
    image(info.cover-image, width: 100%, height: 55%)
    v(20pt)
  } else {

  }

  set align(horizon)

  for s in range(info.title.len()) {
    text(font: 字体.宋体, size: 字号.一号)[#h(40pt)*#info.title.at(s)*]
    v(20pt)
  }

  text(font: 字体.楷体, size: 字号.小四)[#h(50pt)作者：#info.author]
  v(0pt)
  text(font: 字体.楷体, size: 字号.小四)[#h(50pt)日期：#info.date]
  v(50pt)
}