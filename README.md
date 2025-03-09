# Label Studio Deployment for Model Evaluation

This repository contains all necessary files to deploy a Label Studio instance on Render.com for evaluating LLM outputs.

## Files in this Repository

- `Dockerfile`: Configures the Label Studio Docker container
- `render.yaml`: Configuration for Render.com deployment
- `config.xml`: Label Studio interface configuration for the drag-and-drop ranking task
- `data/tasks.json`: Contains all the tasks (68 questions) with model responses

## Deployment Instructions

### 1. Prepare Your GitHub Repository

1. Create a new GitHub repository called `label-studio-deploy`
2. Upload all files from this folder to your repository
3. In the `render.yaml` file, replace `YOUR_USERNAME` with your actual GitHub username

### 2. Deploy on Render.com

1. Create an account on [Render.com](https://render.com) (free)
2. Go to Dashboard → "New Web Service"
3. Connect your GitHub account and select your `label-studio-deploy` repository
4. Use the following settings:
   - Name: `label-studio-eval` (or any name you prefer)
   - Environment: Docker
   - Branch: main
   - Plan: Free
5. Click "Create Web Service"

### 3. Share with Your Evaluator

Once deployed (takes about 5-10 minutes), Render will provide a URL like:
```
https://label-studio-eval.onrender.com
```

Send this URL to your evaluator along with these instructions:

1. Visit the URL
2. Create an account (default username: `heartex@heartex.net`, password: `12345678`)
3. Create a new project called "LLM Evaluation"
4. In project settings → Labeling Interface, the configuration should already be loaded
5. Import the tasks from the data folder
6. Start the evaluation by clicking "Label All Tasks"

### 4. Retrieve Results

Ask your evaluator to:
1. Complete all the ranking tasks
2. Export results (Projects → Your Project → Export → JSON format)
3. Send you the exported JSON file

The JSON file will contain all their rankings in a format that shows which model was preferred for each question.

## Model Mapping

The models in the evaluation are anonymized as follows:
- Model A = Gemma Pretrained in Maithili
- Model B = Gemma Pretrained in Hindi and Maithili
- Model C = Llama8b Pretrained Hindi
- Model D = GPT O1 Baseline
