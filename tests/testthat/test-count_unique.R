library(dplyr)
library(palmerpenguins)

test_that("count_unique function correctly counts unique species by island", {

  unique_species_count <- penguins %>%
    group_by(island) %>%
    summarize(unique_sum = n_distinct(species), .groups = "drop")

  expect_equal(count_unique(penguins, species, island), unique_species_count)

})


test_that("count_unique function handles missing values in `flipper_length_mm`", {

  expected_result <- penguins %>%
    filter(!is.na(flipper_length_mm)) %>%
    group_by(species) %>%
    summarize(unique_sum = n_distinct(flipper_length_mm), .groups = "drop")

  expect_equal(count_unique(penguins, flipper_length_mm, species), expected_result)
})


test_that("count_unique function handles vector of length 0 correctly", {

  empty_penguins <- penguins %>% filter(island == "Nonexistent")

  expect_equal(nrow(count_unique(empty_penguins, species, island)), 0)
})
