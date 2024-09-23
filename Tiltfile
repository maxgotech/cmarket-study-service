# point Tilt at the existing docker-compose configuration.
docker_compose('./docker-compose.yml')
docker_build('cmarket-study-service', '.',
  live_update = [
    sync('.','/docker-cmarket-study-service'),
    run('pip install', trigger='requirements.txt'),
    restart_container()
  ]
)