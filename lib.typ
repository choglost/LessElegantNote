#import "layouts/doc.typ": doc
#import "layouts/preface.typ": preface
#import "layouts/mainmatter.typ": mainmatter
#import "layouts/appendix.typ": appendix

#import "pages/fonts-display-page.typ": fonts-display-page
#import "pages/elegant-cover.typ": elegant-cover
#import "pages/outline-page.typ": outline-page

#import "utils/custom-numbering.typ": custom-numbering
#import "utils/custom-heading.typ": heading-display, active-heading, current-heading
#import "utils/indent.typ": indent, fake-par
#import "utils/style.typ": 字体, 字号
#import "utils/theorem.typ": *


// 使用函数闭包特性，通过 `documentclass` 函数类进行全局信息配置，然后暴露出拥有了全局配置的、具体的 `layouts` 和 `templates` 内部函数。
#let documentclass(
  twoside: false,  // 双面模式，会加入空白页，便于打印
  info: (:),
) = {
  // 默认参数
  info = (
    title: ("LessElegantNote：一个Typst笔记模版"),
    author: "IxionWheel",
    date: datetime.today(),
  ) + info

  (
    // 将传入参数再导出
    twoside: twoside,
    info: info,
    // 页面布局
    
    doc: (..args) => {
      doc(
        ..args,
        info: info + args.named().at("info", default: (:)),
      )
    },
    preface: (..args) => {
      preface(
        twoside: twoside,
        ..args,
      )
    },
    mainmatter: (..args) => {
      mainmatter(
        twoside: twoside,
        info: info + args.named().at("info", default: (:)),
        ..args,
      )
    },
    appendix: (..args) => {
      appendix(
        ..args,
      )
    },

    // 字体展示页
    fonts-display-page: (..args) => {
      fonts-display-page(
        twoside: twoside,
        ..args,
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

    // 目录页
    outline-page: (..args) => {
      outline-page(
        twoside: twoside,
        ..args,
      )
    },

  )
}
