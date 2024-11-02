count_unique <- function(data, summ_var, ..., .groups = "drop") {
  data %>%
    dplyr::group_by(...) %>%
    dplyr::summarize(unique_sum = dplyr::n_distinct({{ summ_var }}[!is.na({{ summ_var }})]), .groups = .groups)
}
