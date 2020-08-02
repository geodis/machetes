[{
  "essential": true,
  "memory": 256,
  "cpu": 256,
  "name": "myapp",
  "image": "${repository_url}:1",
  "workingDirectory": "/app",
  "command": ["npm","start"],
  "portMappings": [{
    "containerPort": 3000,
    "hostPort": 3000
  }]
}]