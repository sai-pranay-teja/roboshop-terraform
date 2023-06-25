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
  policy = jsonencode(
    {
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ssm:CancelCommand",
				"ssm:SendCommand",
				"ssm:ListCommands",
				"ssm:SendAutomationSignal",
				"ssm:CreateActivation",
				"ssm:ListInstanceAssociations",
				"ssm:UpdateAssociation",
				"ssm:CreateOpsItem",
				"ssm:UpdateAssociationStatus",
				"ssm:StartSession",
				"ssm:GetMaintenanceWindowTask",
				"ssm:DescribeAutomationExecutions",
				"ssm:RegisterPatchBaselineForPatchGroup",
				"ssm:DescribeMaintenanceWindowExecutionTaskInvocations",
				"ssm:DescribeAutomationStepExecutions",
				"ssm:ListResourceDataSync",
				"ssm:ListDocuments",
				"ssm:UpdateDocument",
				"ssm:DescribeMaintenanceWindowsForTarget",
				"ssm:UpdateManagedInstanceRole",
				"ssm:PutCalendar",
				"ssm:UpdatePatchBaseline",
				"ssm:ListComplianceItems",
				"ssm:GetMaintenanceWindowExecutionTask",
				"ssm:RegisterTaskWithMaintenanceWindow",
				"ssm:PutResourcePolicy",
				"ssm:GetMaintenanceWindowExecution",
				"ssm:ListResourceComplianceSummaries",
				"ssm:CreateDocument",
				"ssm:DescribeOpsItems",
				"ssm:GetOpsMetadata",
				"ssm:UpdateMaintenanceWindow",
				"ssm:StartAutomationExecution",
				"ssm:DescribeMaintenanceWindows",
				"ssm:CreateAssociation",
				"ssm:CancelMaintenanceWindowExecution",
				"ssm:DescribeEffectivePatchesForPatchBaseline",
				"ssm:DescribeDocumentPermission",
				"ssm:GetAutomationExecution",
				"ssm:DescribePatchGroups",
				"ssm:GetDefaultPatchBaseline",
				"ssm:DescribeDocument",
				"ssm:ListAssociationVersions",
				"ssm:PutConfigurePackageResult",
				"ssm:DescribePatchGroupState",
				"ssm:UpdateMaintenanceWindowTask",
				"ssm:ResetServiceSetting",
				"ssm:CreatePatchBaseline",
				"ssm:DeleteInventory",
				"ssm:DescribeMaintenanceWindowExecutionTasks",
				"ssm:DescribeInstancePatchStatesForPatchGroup",
				"ssm:GetDocument",
				"ssm:CreateResourceDataSync",
				"ssm:GetInventorySchema",
				"ssm:CreateMaintenanceWindow",
				"ssm:GetMaintenanceWindow",
				"ssm:GetParametersByPath",
				"ssm:DescribeAssociationExecutionTargets",
				"ssm:GetPatchBaseline",
				"ssm:ListInventoryEntries",
				"ssm:DescribeAssociation",
				"ssm:ListOpsItemEvents",
				"ssm:DescribeSessions",
				"ssm:DisassociateOpsItemRelatedItem",
				"ssm:DescribePatchBaselines",
				"ssm:GetResourcePolicies",
				"ssm:DeregisterPatchBaselineForPatchGroup",
				"ssm:GetOpsSummary",
				"ssm:DescribePatchProperties",
				"ssm:StopAutomationExecution",
				"ssm:UpdateOpsItem",
				"ssm:UpdateServiceSetting",
				"ssm:DescribeInstanceInformation",
				"ssm:ListTagsForResource",
				"ssm:CreateAssociationBatch",
				"ssm:ModifyDocumentPermission",
				"ssm:DescribeDocumentParameters",
				"ssm:GetCalendar",
				"ssm:RegisterDefaultPatchBaseline",
				"ssm:GetCalendarState",
				"ssm:UpdateInstanceAssociationStatus",
				"ssm:LabelParameterVersion",
				"ssm:ResumeSession",
				"ssm:ListDocumentVersions",
				"ssm:DeregisterTargetFromMaintenanceWindow",
				"ssm:UpdateDocumentDefaultVersion",
				"ssm:ListDocumentMetadataHistory",
				"ssm:DescribeMaintenanceWindowSchedule",
				"ssm:DescribeInstancePatches",
				"ssm:UpdateMaintenanceWindowTarget",
				"ssm:GetParameter",
				"ssm:GetMaintenanceWindowExecutionTaskInvocation",
				"ssm:DeleteActivation",
				"ssm:DeleteParameter",
				"ssm:StartAssociationsOnce",
				"ssm:UnlabelParameterVersion",
				"ssm:UpdateInstanceInformation",
				"ssm:ListOpsMetadata",
				"ssm:DescribeParameters",
				"ssm:PutComplianceItems",
				"ssm:DeleteResourcePolicy",
				"ssm:GetConnectionStatus",
				"ssm:GetOpsItem",
				"ssm:DeleteOpsMetadata",
				"ssm:RegisterTargetWithMaintenanceWindow",
				"ssm:GetParameters",
				"ssm:ListOpsItemRelatedItems",
				"ssm:DeleteParameters",
				"ssm:PutParameter",
				"ssm:UpdateResourceDataSync",
				"ssm:GetServiceSetting",
				"ssm:StartChangeRequestExecution",
				"ssm:DescribeAssociationExecutions",
				"ssm:ListCommandInvocations",
				"ssm:UpdateOpsMetadata",
				"ssm:DescribeMaintenanceWindowTasks",
				"ssm:GetPatchBaselineForPatchGroup",
				"ssm:TerminateSession",
				"ssm:AssociateOpsItemRelatedItem",
				"ssm:DeletePatchBaseline",
				"ssm:DescribeMaintenanceWindowExecutions",
				"ssm:GetManifest",
				"ssm:DescribeInstancePatchStates",
				"ssm:DeleteResourceDataSync",
				"ssm:RegisterManagedInstance",
				"ssm:DeregisterTaskFromMaintenanceWindow",
				"ssm:DescribeInstanceAssociationsStatus",
				"ssm:DescribeInstanceProperties",
				"ssm:GetDeployablePatchSnapshotForInstance",
				"ssm:GetParameterHistory",
				"ssm:DescribeMaintenanceWindowTargets",
				"ssm:DeleteMaintenanceWindow",
				"ssm:DescribeInventoryDeletions",
				"ssm:DescribeEffectiveInstanceAssociations",
				"ssm:GetInventory",
				"ssm:DescribeActivations",
				"ssm:GetCommandInvocation",
				"ssm:DeregisterManagedInstance",
				"ssm:CreateOpsMetadata",
				"ssm:DeleteAssociation",
				"ssm:UpdateDocumentMetadata",
				"ssm:ListComplianceSummaries",
				"ssm:PutInventory",
				"ssm:ListAssociations",
				"ssm:DeleteDocument",
				"ssm:DescribeAvailablePatches"
			],
			"Resource": "arn:aws:ec2:us-east-1:581798224530:instance/*"
      #"Resource": "arn:aws:ssm:us-east-1:581798224530:parameter/*"
		}
	]
}
  )
}

