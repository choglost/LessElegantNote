// 前言
// TODO：目前未使用。建议用无编号的一级标题实现前言页。

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