/*
// https://typst.app/universe/package/frame-it
Quick Start

#import "@preview/frame-it:1.2.0": *
#let (example, feature, variant, syntax) = frames(
  feature: ("Feature",),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be generated
  example: ("Example", gray),
  // You can add as many as you want
  syntax: ("Syntax",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)
*/

#import "@preview/frame-it:1.2.0": *

// #let theorem= frame("定理",rgb("#ff7a7a"),)
// #let lemma= frame("引理",rgb("#ffdb80"))
// #let corollary= frame("推论",rgb("#e3ff80"))
// #let definition= frame("定义",rgb("#86ff80"))

// #let remark = frames("注",)

#let (theorem,lemma,corollary,definition)= frames(
  kind: "theorem",
  theorem:("定理",),
  lemma:("习题",),
  corollary:("推论",),
  definition:("定义")
)

#let (example,exercise)= frames(
  kind: "exercise",
  example:("例题",),
  exercise:("习题",)
)

#let (proof,solution)= frames(
  kind: "answer",
  proof:("证",),
  solution:("答",)
)

#let (remark,hint)= frames(
  kind: "remark",
  remark:("注",gray),
  hint:("提示",)
)

#show: frame-style(kind:"theorem",styles.boxy)
#show: frame-style(kind: "exercise",styles.thmbox)
#show: frame-style(kind: "answer",styles.hint)
#show: frame-style(kind: "remark",styles.hint)


// #theorem[标题][可选标签][Body, i.e. large content block for the frame.]

// #lemma[标题][可选标签][Body, i.e. large content block for the frame.]

// #corollary[标题][可选标签][Body, i.e. large content block for the frame.]

// #definition[标题][可选标签][Body, i.e. large content block for the frame.]


// #example[][Body, i.e. large content block for the frame.]

// #exercise[][Body, i.e. large content block for the frame.]


// #proof[][Body, i.e. large content block for the frame.]

// #solution[][Body, i.e. large content block for the frame.]

// #remark[][Body, i.e. large content block for the frame.]



