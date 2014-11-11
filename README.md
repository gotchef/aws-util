aws-tag
============

Set one or more tags on your ec2 instances using Opsworks

Add the ``aws-util-chef::aws-tag`` recipe 

Add attributes following the structure below:

```
{
    "aws-tag": {
        "tags": {
            "role": "hey we have roles again!!",
            "environment": "dev",
        }
    }
}
```

Requires IAM EC2 instance profile to have a role that allows CreateTags, DescribeTags and DeleteTags.

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1414976005000",
      "Effect": "Allow",
      "Action": [
        "ec2:CreateTags",
        "ec2:DeleteTags",
        "ec2:DescribeTags"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}

```
