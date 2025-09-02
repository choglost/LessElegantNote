// 自定义的分级编号
#import "../utils/font-style.typ": 字体, 字号

#let custom-numbering(style: "literature", ..args) = {
  let literature = ("第一章 ", "第一节 ", "一、", "　　(一)")
  let maths = ("1  ", "1.1 ", "　1.1.1 ", "　　(1)")
  let book = ("第一篇 ", "第一章 ", "第一节 ", "一、", "　(一)","　　(1)")
  // let enumlist = ("1.", "①", "i.") // 无法实现，因为列表的参数深度只有1，不能通过下列方法判断是几级标题从而分别标号

  let numbering-style = ""
  let level = args.pos().len() //根据位置深度判断是几级标题

  if (style == "literature") {
    numbering-style = literature.at(level - 1)
    numbering(numbering-style, args.pos().last())
  } else if (style == "maths") {
    numbering-style = maths.at(level - 1)
    if (level <= 3) {
      numbering(numbering-style, ..args)
    } else {
      numbering(numbering-style, args.pos().last())
    }
  } else if (style == "book") {
    numbering-style = book.at(level - 1)
    numbering(numbering-style, args.pos().last())
  }else {

  }
  return
}



#let get-heading-args(style)={
  let heading-args=()

  if style=="maths"{
    heading-args=(
      style-name:"maths",
      numbering:("1  ", "1.1 ", "　1.1.1 ", "　　(1)"),
      font: (字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体), 
      size: (字号.三号, 字号.四号, 字号.小四, 字号.五号, 字号.五号, 字号.五号), 
      weight: ("bold", "regular", "regular", "regular", "regular", "regular"), 
      above: (20pt, 16pt, 14pt, 10pt, 7pt, 7pt), 
      below: (20pt, 14pt, 10pt, 8pt, 7pt, 7pt),
      pagebreak: (true, false),
      align: (center, auto), 
    )
  }

  if style=="book"{
    heading-args=(
      style-name:"book",
      numbering:("第一篇 ", "第一章 ", "第一节 ", "一、", "　(一)","　　(1)"),
      font: (字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体), // 标题字体，数组内分别是各级标题
      size: (字号.三号, 字号.四号, 字号.小四, 字号.五号, 字号.五号, 字号.五号), // 标题字号
      weight: ("bold", "regular", "regular", "regular", "regular", "regular"), // 标题是否加粗
      above: (20pt, 16pt, 14pt, 10pt, 7pt, 7pt), // 标题上方间距
      below: (20pt, 14pt, 10pt, 8pt, 7pt, 7pt), // 标题下方间距
      pagebreak: (true, false), // 标题是否换页
      align: (center,center,auto), // 标题居中
    )
  }

  return heading-args
}


