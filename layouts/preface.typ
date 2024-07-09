// 前言
#let preface(
  // documentclass 传入的参数
  twoside: false,
  // 其他参数
  ..args,
  it,
) = {
  // 分页
  // if (twoside) {
  //   pagebreak() //+ " "
  // }

  set heading(numbering: "A.")

  it
}