data "aws_caller_identity" "current" {}

locals {
  //name_prefix = split("/", "${data.aws_caller_identity.current.arn}")[1]
  name_prefix = "clifford3"
  email_address = "clifford_cheung@yahoo.com.sg"
}
