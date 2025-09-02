// 目录页。设置“目录页”的布局和内容。
// 如果要更改字体、字号等内容，直接修改参数列表相关项

#import "@preview/outrageous:0.4.0"
#import "../utils/font-style.typ": 字号, 字体

// 创建一个不可见的标题，用于给 outline 加上短标题
#let invisible-heading(..args) = {
  set text(size: 0pt, fill: white)
  heading(numbering: none, ..args)
}

// 目录生成
#let outline-page(
  // documentclass 传入参数
  twoside: false,
  // 其他参数
  title: "目　录", // 目录页的大标题
  outlined: false, //目录页自身是否出现在目录中
  depth: 3, // 显示到几级标题
  title-vspace: 12pt, // 大标题与具体目录的垂直间距
  title-text-args: (font: 字体.黑体, size: 字号.三号), // “目录”大标题的字体、字号
  reference-font: 字体.宋体,// 默认字体（标题引用和页数）
  reference-size: 字号.小五,// 默认字号
  vspace: (6pt, 4pt),// 目录行距，较为紧凑
  ..args,
) = {
  // 与封面之间是否有空白页，用于双面打印
  pagebreak(weak: true, to: if twoside { "odd" }) 
  
  // 目录页的页码
  set page(
    footer: context [
      #set align(center)
      #set text(font: 字体.宋体)
      #text(counter(page).display("I"))
    ]
  )
  counter(page).update(1)

  // 设置目录页大标题
  {
    set align(center)
    text(..title-text-args, title)
  }


  invisible-heading(level: 1, outlined: outlined, title)// 标记一个不可见的标题，用于在outline中生成本身标题

  v(title-vspace)
  
  set text(font: reference-font, size: reference-size)
  show outline.entry: outrageous.show-entry.with(
    ..outrageous.presets.typst,// 保留 Typst 基础样式
    
    font:(字体.黑体,字体.宋体,字体.宋体,字体.宋体,), // 各级标题字体
    vspace: vspace, // 行间距
    fill: (auto,), // 各级标题到页码间的填充

    // TODO：修改分级缩进、字号，或者取消导入outrageous包自己实现
  )

  // 显示目录
  outline(title: none,depth: depth)
}