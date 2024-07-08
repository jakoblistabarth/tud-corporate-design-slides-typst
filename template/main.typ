#import "@preview/tud-slides:0.1.0": *

#show: tud-slides.with(
  title: "Presentation templates",
  subtitle: "Corporate design rules - Guidelines for using the template and ensuring accessibility",
  author: "Firstname Lastname",
  organizational-unit: "Directorate 7 - Strategy and Communication",
  location-occasion: "Location or occasion of the presentation",
  lang: "en",
)

#title-slide

#slide[
  = Slide title
  - #lorem(3)
  - #lorem(5)
  - #lorem(2)
]

#slide[
  = Slide title
  #lorem(30)
]

#slide[
  = Slide title for a slide with a figure
  #figure(
    rect(
      width: 80%,
      height: 80%,
      radius: .25em,
      fill: tud-gradient,
    )[
      #align(horizon)["Hello, world!"]
    ],
    caption: "Figure caption"
  )
]

#section-slide(
  title: "Section title",
  subtitle: "Section subtitle",
)

#slide[
  = Slide title
  - #lorem(4)
  - #lorem(2)
  - #lorem(3)
]
