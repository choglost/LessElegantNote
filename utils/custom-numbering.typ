// 一个简单的自定义 Numbering
#let custom-numbering(style:"literature",..args) = {
  let literature-numbering=("第一章 ","第一节 ","一、","　　（一）")
  let maths-numbering=("第一章 ","1.1 ","1.1.1 ","（1）")
  
  let heading-numbering=""

  let level = args.pos().len()
  // // let heading-numbering = ""
  // // heading-numbering = args.pos().at(level - 1)
  // if level
  if(style=="literature"){
    heading-numbering=literature-numbering.at(level - 1)
    numbering(heading-numbering, args.pos().last())
  }else if(style=="maths"){
    heading-numbering=maths-numbering.at(level - 1)
    numbering(heading-numbering, ..args)
  }else{

  }
  
  return
}
