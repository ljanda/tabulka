#' @title Categorical Table Function Arranged by Percentage Value
#'
#' @description This function allows you to make a kabled table of count and pct
#' @param df A dataframe
#' @param var1 A variable
#' @keywords table, count, percent
#' @examples
#' n_pct(df, var1)
#' @export
n_pct <- function(df, var1) {
  var1 <- enquo(var1)

  df %>%
    group_by(!!var1) %>%
    summarise(Number = n()) %>%
    mutate(Percent = round((Number/sum(Number, na.rm = TRUE)*100), 2)) %>%
    arrange(desc(Percent)) %>%
    kable(format = "markdown", format.args = list(big.mark = ',')) %>%
    kable_styling(full_width = F, position = "left")
}

#' @title Categorical Table Function Arranged by Factor Levels
#'
#' @description This function allows you to make a kabled table of count and pct and arrange it by the factor levels
#' @param df A dataframe
#' @param var1 A factor variable
#' @keywords table, count, percent
#' @examples
#' n_pct(df, var1)
#' @export
n_pct_fct <- function(df, var1) {
  var1 <- enquo(var1)

  df %>%
    group_by(!!var1) %>%
    summarise(Number = n()) %>%
    mutate(Percent = round((Number/sum(Number, na.rm = TRUE)*100), 2)) %>%
    arrange(!!var1) %>%
    kable(format = "markdown", format.args = list(big.mark = ',')) %>%
    kable_styling(full_width = F, position = "left")
}

#' @title Continuous Table Function
#'
#' @description This function allows you to make a kabled table of Q1, mean, median, Q2, max
#' @param x A dataframe
#' @param y A grouping variable
#' @param z A continuous variable
#' @keywords table, Q1, mean, median, Q2, max
#' @examples
#' n_pct(df, var1, var2)
#' @export
shelve <- function(df, var1, var2) {
  var1 <- enquo(var1)
  var2 <- enquo(var2)

  df %>%
    group_by(!!var1) %>%
    summarise(Q1 = round(quantile(!!var2, 1/4), 2),
              Median = round(median(!!var2), 2),
              Mean = round(mean(!!var2), 2),
              Q3 = round(quantile(!!var2, 3/4), 2),
              Max = round(max(!!var2), 2)) %>%
    kable(format = "markdown", format.args = list(big.mark = ','),
          col.names = c("Group", "Q1", "Median", "Mean", "Q3", "Max")) %>%
    kable_styling(full_width = FALSE, position = "left")
}
