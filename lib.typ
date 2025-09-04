// 用户在自己文件中直接引用的lib文件。
// 使用函数闭包特性，通过 `documentclass` 函数类进行全局信息配置，然后暴露出拥有了全局配置的、具体的 `layouts` 和 `templates` 内部函数。

// 主设置
#import "layouts/doc.typ": doc
// 几种固定内容的页面
#import "pages/elegant-cover.typ": elegant-cover
#import "pages/outline-page.typ": outline-page
#import "pages/fonts-display-page.typ": fonts-display-page
// 文本格式
#import "layouts/mainmatter.typ": mainmatter
#import "layouts/appendix.typ": appendix
// 小工具
#import "utils/heading.typ": custom-numbering
#import "utils/font-style.typ": 字体, 字号
#import "utils/custom-format.typ": *

#let documentclass(
  twoside: false, // 双面模式，会加入空白页，便于打印
  info: (:),
) = {
  // 默认参数
  info = (
    (
      title: "LessElegantNote：一个Typst笔记模版",
      author: "choglost",
      date: datetime.today(),
      cover-image:none
    )
      + info
  )
  
  (
    // 将传入参数再导出
    twoside: twoside,
    info: info,
    // 主设置
    doc: (..args) => {
      doc(
        ..args,
        info: info + args.named().at("info", default: (:)),
      )
    },
    // 封面页
    cover: (..args) => {
      elegant-cover(
        twoside: twoside,
        info: info + args.named().at("info", default: (:)),
        ..args,
      )
    },
    // 字体展示页
    fonts-display-page: (..args) => {
      fonts-display-page(twoside: twoside, ..args)
    },
    // 目录页
    outline-page: (..args) => { outline-page(twoside: twoside, ..args) },
    // 正文部分
    mainmatter: (..args) => {
      mainmatter(
        twoside: twoside,
        info: info + args.named().at("info", default: (:)),
        ..args,
      )
    },
    // 附录部分
    appendix: (..args) => { appendix(..args) },
  )
}
