resource "aws_iam_user" "aws_users" {
  count         = length(var.aws_iam_user)
  name          = element(var.aws_iam_user, count.index)
  path          = "/"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "login_profile" {
  count                   = length(var.aws_iam_user)
  user                    = element(var.aws_iam_user, count.index)
  pgp_key                 = "keybase:test"
  password_reset_required = true
  password_length         = "6"
}

resource "aws_iam_access_key" "access_key" {
  count   = length(var.aws_iam_user)
  user    = element(var.aws_iam_user, count.index)
  pgp_key = "keybase:test"
}

output "encrypted_secret" {
  value = join("\n", aws_iam_access_key.access_key.*.encrypted_secret)
}

output "id" {
  value = join("\n", aws_iam_access_key.access_key.*.id)
}

output "user" {
  value = join("\n", aws_iam_access_key.access_key.*.user)
}
