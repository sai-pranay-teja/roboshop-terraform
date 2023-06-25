resource "aws_iam_instance_profile" "access-profile" {
  name = "${var.env}-jenkins-profile"
  role = aws_iam_role.access-role.name
}


resource "aws_iam_policy_attachment" "access-attachment" {
  name       = "${var.env}-jenkins-attachment"
  roles      = [aws_iam_role.access-role.name]
  policy_arn = aws_iam_policy.access-policy.arn
}


resource "aws_iam_role" "access-role" {
  name = "${var.env}-jenkins-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "access-policy" {
  name        = "${var.env}-policy-jenkins"
  path = "/"
  policy = jsonencode(
    {
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ssm:CancelCommand",
				"ssm:ListCommands",
				"ssm:DescribeMaintenanceWindowSchedule",
				"ssm:DescribeInstancePatches",
				"ssm:CreateActivation",
				"ssm:CreateOpsItem",
				"ssm:GetMaintenanceWindowExecutionTaskInvocation",
				"ssm:DescribeAutomationExecutions",
				"ssm:DeleteActivation",
				"ssm:DescribeMaintenanceWindowExecutionTaskInvocations",
				"ssm:ListOpsMetadata",
				"ssm:DescribeParameters",
				"ssm:ListResourceDataSync",
				"ssm:ListDocuments",
				"ssm:DescribeMaintenanceWindowsForTarget",
				"ssm:ListComplianceItems",
				"ssm:GetMaintenanceWindowExecutionTask",
				"ssm:GetMaintenanceWindowExecution",
				"ssm:ListResourceComplianceSummaries",
				"ssm:ListOpsItemRelatedItems",
				"ssm:DescribeOpsItems",
				"ssm:DescribeMaintenanceWindows",
				"ssm:ListCommandInvocations",
				"ssm:DescribePatchGroups",
				"ssm:PutConfigurePackageResult",
				"ssm:DescribePatchGroupState",
				"ssm:CreatePatchBaseline",
				"ssm:GetManifest",
				"ssm:DeleteInventory",
				"ssm:DescribeInstancePatchStates",
				"ssm:DescribeInstancePatchStatesForPatchGroup",
				"ssm:RegisterManagedInstance",
				"ssm:GetInventorySchema",
				"ssm:CreateMaintenanceWindow",
				"ssm:DescribeInstanceProperties",
				"ssm:ListInventoryEntries",
				"ssm:ListOpsItemEvents",
				"ssm:GetDeployablePatchSnapshotForInstance",
				"ssm:DescribeSessions",
				"ssm:DescribePatchBaselines",
				"ssm:DescribeInventoryDeletions",
				"ssm:DescribePatchProperties",
				"ssm:GetInventory",
				"ssm:DescribeActivations",
				"ssm:GetCommandInvocation",
				"ssm:CreateOpsMetadata",
				"ssm:ListComplianceSummaries",
				"ssm:PutInventory",
				"ssm:DescribeInstanceInformation",
				"ssm:ListAssociations",
				"ssm:DescribeAvailablePatches"
			],
			"Resource": "arn:aws:ec2:us-east-1:581798224530:instance/*"
		},
		{
			"Sid": "VisualEditor1",
			"Effect": "Allow",
			"Action": "ssm:*",
			"Resource": "arn:aws:ec2:us-east-1:581798224530:instance/*"
		}
	]
}
  )
}

