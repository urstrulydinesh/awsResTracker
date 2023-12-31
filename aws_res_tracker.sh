!/bin/bash


# Author: Sai Dinesh
# Date : 31-12-23

#Version: v1
#Report the AWS resource usage (S3, EC2, AWS IAM users)

set -x #debug mode

LOG_FILE="aws_resTracker.log"



function track_ec2_instances(){
        echo "Tracking EC2 instances...">>"$LOG_FILE"
        aws ec2 describe-instances | jq  '.Reservations[].Instances[].InstanceId'  >> "$LOG_FILE"
        aws s3 ls >> "$LOG_FILE"
        aws iam list-users >> "$LOG_FILE"
        echo "Tracking COmpleted....">> "$LOG_FILE"
}


function main() {
        date >> "$LOG_FILE"
        echo "AWS Resource Tracker" >> "$LOG_FILE"
        track_ec2_instances
}

main

