<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Scaling n8n - GitHub README</title>
  <style>
    body { font-family: Arial, sans-serif; line-height: 1.6; padding: 20px; background-color: #f9f9f9; }
    h1, h2, h3 { color: #2c3e50; }
    img { max-width: 100%; border: 1px solid #ccc; margin: 20px 0; }
    code { background: #eee; padding: 2px 4px; border-radius: 4px; }
  </style>
</head>
<body>

<h1>🚀 Scaling n8n with Docker Compose</h1>

<p>This repository contains a <strong>scalable, resilient</strong> Docker-based architecture for <a href="https://n8n.io">n8n</a> – an open-source workflow automation platform. It includes autoscaling workers, webhook separation, Redis queueing, and PostgreSQL persistence.</p>

<p>GitHub Repository: <a href="https://github.com/khamzatMurj/Scaling-n8n">github.com/khamzatMurj/Scaling-n8n</a></p>

<h2>📌 Architecture Overview</h2>

<p>This project enables scalable performance for n8n by separating responsibilities across multiple services. Here's how the system works:</p>

<ul>
  <li><strong>PostgreSQL:</strong> Stores all persistent data (workflows, executions, users).</li>
  <li><strong>n8n Main:</strong> Core service managing workflow logic, database access, and job delegation.</li>
  <li><strong>Redis:</strong> Queues jobs and allows decoupled execution through workers.</li>
  <li><strong>n8n Webhook:</strong> A lightweight instance for handling fast webhook responses without blocking.</li>
  <li><strong>n8n Workers:</strong> Scalable instances that process jobs asynchronously from the Redis queue.</li>
  <li><strong>n8n Autoscaler:</strong> Monitors queue length and scales workers accordingly.</li>
  <li><strong>Redis Monitor:</strong> Visualizes queue statistics and metrics for debugging or optimization.</li>
</ul>

<h2>🧠 Key Design Principles</h2>

<ul>
  <li><strong>Queue Mode Execution:</strong> Uses Redis to asynchronously execute workflows via dedicated workers.</li>
  <li><strong>Autoscaling:</strong> Worker containers scale up/down depending on job load.</li>
  <li><strong>Separation of Concerns:</strong> Webhooks and job processing are delegated to distinct containers.</li>
  <li><strong>Health Checks:</strong> Each service exposes a health endpoint to detect failure or overload.</li>
  <li><strong>Secure Networking:</strong> Uses Docker Compose networks for isolated service communication.</li>
</ul>

<h2>🖼️ Architecture Diagrams</h2>

<h3>1. Activity Diagram</h3>
<p>This diagram shows the high-level logic of how the system components interact dynamically.</p>
<img src="./images/activityDiagramm.png" alt="Activity Diagram" style="max-width:800px; width:100%; height:auto; display:block; margin:24px auto; box-shadow:0 2px 8px rgba(0,0,0,0.08); border-radius:8px; border:1px solid #ccc;" />

<h3>2. Sequence Diagram</h3>
<p>This illustrates the lifecycle of a workflow execution from webhook trigger to worker processing.</p>
<img src="./images/sequenceDiagramm.png" alt="Sequence Diagram" style="max-width:800px; width:100%; height:auto; display:block; margin:24px auto; box-shadow:0 2px 8px rgba(0,0,0,0.08); border-radius:8px; border:1px solid #ccc;" />

<h3>3. State Transition Diagram</h3>
<p>Describes the states a job goes through (e.g., pending, running, completed, failed).</p>
<img src="./images/StateTransition.png" alt="State Transition Diagram" style="max-width:800px; width:100%; height:auto; display:block; margin:24px auto; box-shadow:0 2px 8px rgba(0,0,0,0.08); border-radius:8px; border:1px solid #ccc;" />
