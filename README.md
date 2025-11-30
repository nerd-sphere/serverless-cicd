# serverless-cicd
Serverless CI/CD on AWS with Terraform & GitHub Actions

This project demonstrates a complete Serverless DevOps workflow using:
1. AWS Lambda (Python)
2. Terraform (Infrastructure as Code), S3 + DynamoDB (Terraform remote backend)
3. GitHub Actions (CI/CD pipeline)

Every time you push code to the main branch, the pipeline automatically:
1. Packages your Lambda function
2. Runs Terraform
3. Deploys the updated Lambda to AWS
4. Applies any infrastructure updates

This is a production-style serverless CI/CD setup—simple, clean, and fully automated.

Tools & Requirements

1. AWS Account (Free Tier is enough)
2. Terraform installed
3. GitHub repository
4. VS Code or any code editor
5. (Optional) AWS CLI configured locally


Lambda Function (Python) - A simple Python Lambda that returns a dynamic message:
Terraform (Infrastructure as Code), Key components:
        archive_file → Packages Lambda code into a ZIP
        aws_lambda_function → Deploys Lambda
        aws_iam_role → Execution role for Lambda
        S3 backend + DynamoDB → Remote state + locking

    You can deploy everything locally using:
        cd terraform
        terraform init
        terraform plan
        terraform apply -auto-approve

GitHub Actions — CI/CD Pipeline Located in ./github/workflows/deploy.yml
    What the pipeline does:
        1. Trigger on every push to main
        2. Checkout code
        3. Install Terraform
        4. Configure AWS credentials using GitHub Secrets
        5. Run terraform init, plan, and apply
        6. Automatically deploy new Lambda version
    Required Repository Secrets:
        AWS_ACCESS_KEY_ID
        AWS_SECRET_ACCESS_KEY
    Add these under:
    GitHub → Repository → Settings → Secrets → Actions

How Deployment Works

1. You modify the Lambda code
2. Commit + push to main
3. GitHub Actions pipeline starts
4. Terraform packages and deploys the new Lambda
5. AWS console reflects the updated version
6. Zero manual steps. Full automation.

Testing Lambda
    After deployment:
        Go to AWS Console → Lambda
        Select your function
        Create a test event
    Run the test
        Check CloudWatch Logs for execution details
