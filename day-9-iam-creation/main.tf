resource "aws_iam_group" "sonu" {
  name = "sonu"
}

resource "aws_iam_group_policy_attachment" "example_group_policy" {
  group      = aws_iam_group.sonu.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
