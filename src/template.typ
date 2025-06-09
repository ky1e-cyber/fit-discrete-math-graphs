// Template by chair (🪑)

#let template(doc) = {
  set text(font: "New Computer Modern", lang: "ru", hyphenate: false)
  set par(justify: true, linebreaks: "optimized")
  set page(paper: "a4", columns: 2, numbering: "1")

  let theorem_counter = counter("Теорема")
  context theorem_counter.update(1)

  let lemma_counter = counter("Лемма", )
  context lemma_counter.update(1)
  
  let collolary_counter = counter("Следствие")
  context collolary_counter.update(1)

  let sugestion_counter = counter("Предложение")
  context sugestion_counter.update(1)
  
  set enum(indent: 1.5em, body-indent: 0.5em)
  
  show heading.where(level: 1): it => par(justify: false, spacing: 2em)[#it.body]
  doc
}

#let def_template(type, name: none, ..body) = {
  [*#type*. ]
  if name != none {
    heading(name, level: 2)
  }
  body.pos().at(0)
  h(1em)
}

#let theoreme_template(type, theoreme_name: none, name: none, ..body) = {
  let dispay_name

  if name != none {
    heading(name, level: 2)
  }

  if theoreme_name == none {
    dispay_name = ""
  } else {
    dispay_name = [(#theoreme_name)]
  }

  [*#type #context counter(type).display()*#dispay_name. ]
  counter(type).step()
  //
  if (body.pos().len() > 1) {
    body.pos().at(0)
    [\ ]
    v(0.01em)
    [*Доказательство.* ]
    body.pos().at(1)
    h(1fr)
    $square$
  } else {
    body.pos().at(0)
  }
  h(1em)
}

#let definition(name: none, ..body) = def_template(
  "Определение",
  name: name,
)[#body.at(0)]
#let example(name: none, ..body) = def_template(
  "Упражнение",
  name: name,
)[#body.at(0)]

#let suggestion(theoreme_name: none, name: none, ..body) = theoreme_template(
  "Предложение",
  theoreme_name: theoreme_name,
  name: name,
  ..body,
)
#let theorem(theoreme_name: none, name: none, ..body) = theoreme_template(
  "Теорема",
  theoreme_name: theoreme_name,
  name: name,
  ..body
)
#let lemma(theoreme_name: none, name: none, ..body) = theoreme_template(
  "Лемма",
  theoreme_name: theoreme_name,
  name: name,
  ..body
)
#let collolary(theoreme_name: none, name: none, ..body) = theoreme_template(
  "Следствие",
  theoreme_name: theoreme_name,
  name: name,
  ..body,
)

// Объявления символов
#let start = box($triangle.r.small$, baseline: 0.1em)
#let end = box($triangle.l.small$, baseline: 0.1em)
#let empty = box(
  text(math.bracket.b, size: 1.5em),
  inset: (y: -8pt),
  baseline: -1.2em,
)
#let sequ = math.op([$tack.r$])
#let gramma = $ G = angle.l V, Sigma, S, R angle.r $
#let arr = math.op([$arrow.double$])
#let helpers = ${start, empty, end}$
#let sigma0cl = $(Sigma_0)^*$ // TODO: Заменить все вхождения
