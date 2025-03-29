#import "@preview/ctheorems:1.1.3": *

// 定义定理环境
#let theorem = thmbox("theorem", "定理", fill: rgb("#e8e8f8"),)
#let lemma = thmbox("theorem", "引理", fill: rgb("#efe6ff"),) // 与Theorems共同计数
#let corollary = thmbox("corollary", "推论", base: "theorem", fill: rgb("#f8e8e8"),)// 'Attached' to Theorems

#let definition = thmbox("definition", "定义", fill: rgb("#e8f8e8"),)// 单独计数

#let exercise = thmbox("exercise", "习题", stroke: rgb("#ffaaaa") + 1pt, base: none,).with(numbering: "I",) // 单独计数

// Examples and remarks are not numbered
#let example = thmplain("example", "例").with(numbering: none,)
#let remark = thmplain("remark", "注", inset: 0em,).with(numbering: none)

#let proof = thmproof("proof", "证明", base: "theorem",)

#let solution = thmplain("solution","答", base: "exercise", inset: 0em,).with(numbering: none)


// Shorthand for vectors
#let va = $bold(a)$
#let vb = $bold(b)$
#let vx = $bold(x)$
#let vy = $bold(y)$
#let vz = $bold(z)$
#let vv = $bold(v)$
#let vw = $bold(w)$
#let ve = $bold(e)$

// Mapping arrow
#let mapsto = $arrow.r.bar$

// Operators
#let grad = x => $nabla #x$
#let ip = (x, y) => $angle.l #x, #y angle.r$
#let pp = (x, y) => $(diff #x) / (diff #y)$
#let dd = (x, y) => $(d #x) / (d #y)$
#let Df = $D f$
#let Dg = $D g$
#let DT = $D T$

