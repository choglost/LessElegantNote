// 自定义的分级编号
#let custom-numbering(style: "literature", ..args) = {
  let literature = ("第一章 ", "第一节 ", "一、", "　　(一)")
  let maths = ("第一章 ", "1.1 ", "　1.1.1 ", "　　(1)")
  let book = ("第一部分 ", "第一章 ", "第一节 ", "一、", "　(一)")
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
