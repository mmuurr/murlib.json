#' @export
json2obj <- function(json, ...) {
  checkmate::assert_string(json)
  args <- rlang::dots_list(json, simplifyVector = FALSE, simplifyDataFrame = FALSE, simplifyMatrix = FALSE, ..., .homonyms = "last")
  rlang::exec(jsonlite::fromJSON, !!!args)
}


#' @export
obj2json <- function(x, json_as_string = FALSE, ...) {
  args <- rlang::dots_list(x, auto_unbox = TRUE, null = "null", na = "null", json_verbatim = json_as_string, ..., .homonyms = "last")
  rlang::exec(jsonlite::toJSON, !!!args)
}


#' @export
json <- function(x, validate = TRUE) {
  if (isTRUE(validate)) checkmate::assert(jsonlite::validate(x))
  murlib.core::prepend_class(x, "json")
}
