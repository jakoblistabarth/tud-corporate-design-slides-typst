#import "@preview/polylux:0.3.1": polylux-slide, logic, utils, pause, only

#let tud-outer-margin = 15pt
#let tud-inner-margin = 60pt
#let tud-top-margin = 75pt
#let tud-bottom-margin = 90pt

#let tud-title = state("tud-title", none)
#let tud-subtitle = state("tud-sub-title", none)
#let tud-short-title = state("tud-short-title", none)
#let tud-author = state("tud-author", [])
#let tud-short-author = state("tud-short-author", none)
#let tud-organizational-unit = state("tud-organizational-unit", none)
#let tud-date = state("tud-date", none)
#let tud-location-occasion = state("tud-location-occasion", none)

#let tud-darkblue = rgb(0, 48, 94)
#let tud-lightblue = rgb(0, 106, 179)
#let tud-gradient = gradient.linear(tud-darkblue, tud-lightblue, angle: 45deg)

#let tud-date-format = "[month repr:long] [day], [year]"

#let tud-slides(
  title: none,
  subtitle: none,
  short-title: none,
  author: none,
  short-author: none,
  organizational-unit: none,
  lang: "en",
  date: datetime.today(),
  location-occasion: none,
  body
) = {
  set document(title: title, author: author)

  set page(
    paper: "presentation-16-9",
    margin: 0pt
  )
  set text(font: ("Open Sans"), lang: lang, fill: tud-darkblue)
  set list(marker: [---])

  show figure.caption: set text(size: .6em, fill: luma(150))

  tud-date.update(date)
  tud-title.update(title)
  tud-subtitle.update(subtitle)
  tud-short-title.update(title)
  tud-author.update(author)
  if (short-author == none) {
    tud-short-author.update(author)
  } else {
    tud-short-author.update(short-author)
  }
  tud-organizational-unit.update(organizational-unit)
  tud-location-occasion.update(location-occasion)

  body
}

#let title-slide = {
  let content = {
    place(dx: 0pt, dy: 0pt)[
      #rect(fill: tud-gradient, width: 100%, height: 100%)
    ]

    block(
      width: 100%,
      height: 15%,
      fill: white,
      inset: (x: tud-outer-margin, y: 15%),
      grid(
        columns: (1fr, auto),
        image("logos/TU_Dresden_Logo_blau.svg", height: 100%),
        image("logos/dresden-concept.svg")
      )
    )

    place(dx: 0pt, dy: 0pt,
      block(
        width: 100%,
        height: 85%,
        inset: (x: tud-inner-margin),
        {
          set align(left + horizon)
          set text(fill: rgb(255, 255, 255, 150))
          text(
            weight: "bold",
            context tud-organizational-unit.get()
          )
          linebreak()
          context tud-short-author.get()
          parbreak()
          text(size: 2.5em, fill: white, weight: "bold", context tud-title.get())
          parbreak()
          context tud-subtitle.get()
          linebreak()
          context [
            #tud-location-occasion.get() \/\/ #tud-date.get().display(tud-date-format)
          ]
        }
      )
    )
  }

  polylux-slide(content)
}

#let footer = block(width: 100%, height: 100%, fill: white)[
  #set block(above: 0pt)
  #set text(size: 8pt,  fill: luma(150))
  #block(width: 100%, height: 100%, inset: (x: tud-outer-margin, y: 10pt))[
    #align(horizon)[
      #grid(
        columns: (auto, 1fr, .5fr, auto),
        gutter: 50pt,
        pad(left: 20pt,
          image(
            "logos/TU_Dresden_Logo_blau.svg", height: 5em
          ),
        ),
        {
          set block(above: .6em)
          set par(leading: 0.5em)
          context [#tud-short-title.get()]
          parbreak()
          context [#tud-organizational-unit.get() / #tud-short-author.get()]
          parbreak()
          context [#tud-location-occasion.get() \/\/ #tud-date.get().display(tud-date-format)]
        },
        [
          Slide #logic.logical-slide.display()/#strong(utils.last-slide-number)
        ],
        image(
          "logos/dresden-concept.svg",
          height: 5em
        )
      )
    ]
  ]
]

#let slide(body) = {
  // Content block
  let wrapped-body = block(
    width: 100%,
    height: 100%,
    inset: (x: tud-inner-margin),
  )[
    #set text(16pt)
    #set block(above: 1.2em)
    #body
  ]

  set page(
    footer: footer,
    footer-descent: 0pt,
    margin: (
      top: tud-top-margin,
      bottom: tud-bottom-margin
    ),
  )
  polylux-slide(wrapped-body)
}

#let fluid-slide(body) = {
  // Content block
  let wrapped-body = block(
    width: 100%,
    height: 100%,
  )[
    #set text(16pt)
    #set block(above: 1.2em)
    #body
  ]

  set page(
    footer: footer,
    footer-descent: 0pt,
    margin: (
      bottom: tud-bottom-margin
    ),
  )
  polylux-slide(wrapped-body)
}

#let section-slide(title: none, subtitle: none) = {
  // Content block
  let wrapped-body = block(
    width: 100%,
    height: 100%,
    inset: (x: tud-inner-margin),
  )[
    #set align(horizon)
    #set text(2.5em, fill: white)
    #set block(above: .5em)
    #text(weight: "bold", title)
    #parbreak()
    #text(fill: rgb(255, 255, 255, 150), subtitle)
  ]

  set page(
    footer: footer,
    background: {
      rect(width: 100%, height: 100%, fill: tud-gradient)
    },
    footer-descent: 0pt,
    margin: (
      top: tud-top-margin,
      bottom: tud-bottom-margin
    ),
  )
  polylux-slide(wrapped-body)
}