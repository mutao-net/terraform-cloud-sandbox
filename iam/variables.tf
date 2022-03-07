variable "aws_iam_user" {
  type = list(string)

  default = [
    "mutao.admin",
    "dev",
  ]
}

variable "aws_iam_group" {
  type = list(string)

  default = [
    "administrator",
    "development",
    "operators",
  ]
}
