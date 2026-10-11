library(edibble)
set.seed(2020)
options(tibble.print_max = Inf)
options(tibble.width = Inf)
options(width = 250)

design(name='Skinergy') |>
  set_units(participant = 10,
            block = nested_in(participant, 10),
            trial = nested_in(block, 11)) |>
  set_trts(gesture = c("Tap", "Double Tap", "Swipe Left", "Swipe Right",  "Swipe Up", "Swipe Down", 
    "Clockwise Swipe", "Counterclockwise Swipe", "Pinch", "Spread", "Rest")) |>
  allot_trts(gesture ~ trial) |>
  assign_trts('random', seed=2) |>
  serve_table()