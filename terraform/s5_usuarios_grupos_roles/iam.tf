# grupo
resource "aws_iam_group" "administrators" {
  name = "administrators"

}

# grupo-policy-attach
resource "aws_iam_policy_attachment" "administrators-attach" {
  name = "administrators-attach"
  # grupos
  groups = [aws_iam_group.administrators.name]
  # policy que les attacheo
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# usuario
resource "aws_iam_user" "admin1" {
  name = "admin1"
}
resource "aws_iam_user" "admin2" {
  name = "admin2"
}

# usuario-grupo
resource "aws_iam_group_membership" "administrators-users" {
  name = "administrators-users"
  group = "aws_iam_group.administrators.name"
  users = [aws_iam_user.admin1.name, aws_iam_user.admin2.name]
}