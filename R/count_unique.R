#' Count Unique Values by Group
#'
#' This function calculates the number of unique values in a specified column (`summ_var`) within each group defined by one or more grouping variables. It is useful for understanding the distribution of unique values within groups.
#'
#' @param data A data frame or tibble containing the data to be summarized. Chose `data` as it clearly indicates the primary data input.
#' @param summ_var The variable for which unique values are counted within each group. Named `summ_var` to clearly denote that this is the summarized variable in the count.
#' @param ... One or more grouping variables within the dataset. These variables define the grouping structure for summarizing `summ_var`. The `...` notation allows for flexible input of single or multiple variables.
#' @param .groups A character string indicating how to handle grouping in the result. Options are "drop" (default), "keep", "drop_last", or "rowwise". The `.groups` name follows `dplyr` syntax for familiarity.
#'
#' @return A tibble with one row per group and a column `unique_sum`, showing the count of unique values in `summ_var` for each group defined by `...`.
#' @export
#' @importFrom dplyr %>%
#'
#' @examples
#' data <- data.frame(
#'   category = c("A", "A", "B", "B", "C"),
#'   subgroup = c(1, 1, 2, 2, 1),
#'   value = c(10, 20, 10, NA, 30)
#' )
#'
#' # Count unique values in `value` by `category`
#' count_unique(data, summ_var = value, category)
#'
#' # Count unique values in `value` by both `category` and `subgroup`
#' count_unique(data, summ_var = value, category, subgroup)

count_unique <- function(data, summ_var, ..., .groups = "drop") {
  data %>%
    dplyr::group_by(...) %>%
    dplyr::summarize(unique_sum = dplyr::n_distinct({{ summ_var }}[!is.na({{ summ_var }})]), .groups = .groups)
}


