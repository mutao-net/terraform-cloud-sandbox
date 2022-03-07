resource "aws_iam_group_membership" "aws_group_membership" {
  count = length(var.aws_iam_user)
  name  = "group_membership"

  users = [
    "${element(var.aws_iam_user, count.index)}",
  ]

  group = element(var.aws_iam_group, 0)
}

resource "aws_iam_group" "group" {
  count = length(var.aws_iam_group)
  name  = element(var.aws_iam_group, count.index)
}

resource "aws_iam_group_policy_attachment" "policy-attach" {
  count      = length(var.aws_iam_group)
  group      = element(var.aws_iam_group, count.index)
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
