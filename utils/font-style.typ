// 配置字体

#let 字号 = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)

#let 字体 = (
  // 宋体，属于「有衬线字体」，一般可以等同于英文中的 Serif Font
  // FZShuSong-Z01S
  宋体: ("Times New Roman","SimSun"),

  // 黑体，属于「无衬线字体」，一般可以等同于英文中的 Sans Serif Font
  // FZHei-B01S, SimHei
  黑体: ("Calibri","SimHei"),

  // 等宽字体，用于raw和代码块环境，一般可以等同于英文中的 Monospaced Font
  等宽: ("Consolas", "SimSun"),

  // 楷体，用于注解
  楷体: ("Times New Roman","KaiTi"),// FZKai-Z03S
  仿宋: ("Times New Roman","KaiTi"),//FZFangSong-Z02S

  // 数学公式字体
  数学: ("New Computer Modern Math","KaiTi")//FZFangSong-Z02S
)
