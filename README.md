aws-tag
============

Set one or more tags on your ec2 instances using Opsworks

Add the ``aws-util-chef::aws-tag`` recipe 

Add attributes following the structure below:

```json
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

```json
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

# aws-util::dnsupdate

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['dnsupdate']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### dnsupdate::default

Include `dnsupdate` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[aws-util::dnsupdate]"
  ]
}
```


IAM User Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1403515694000",
      "Effect": "Allow",
      "Action": [
        "route53:ChangeResourceRecordSets",
        "route53:GetHostedZone",
        "route53:ListResourceRecordSets"
      ],
      "Resource": [
        "arn:aws:route53:::hostedzone/<insert your hosted zone ID>"
      ]
    }
  ]
}
```


## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
