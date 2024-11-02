count_unique <- function(data, summ_var, ..., .groups = "drop") {
  data %>%
    group_by(...) %>%
    summarize(unique_sum = n_distinct({{ summ_var }}[!is.na({{ summ_var }})]), .groups = .groups)
}
