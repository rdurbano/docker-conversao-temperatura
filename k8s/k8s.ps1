#criar imagem docker
cd src
docker build -t rdurbano/docker_conversao_temp:v1 .
docker tag rdurbano/docker_conversao_temp:v1 rdurbano/docker_conversao_temp:latest
docker image ls
docker login
docker push rdurbano/docker_conversao_temp:v1
docker push rdurbano/docker_conversao_temp:latest


#criar o cluster
cd k8s
kind delete cluster --name kubecluster
kind create cluster --name kubecluster --config .\cluster.yaml

kind get clusters
kubectl get nodes
docker container ls
docker container inspect 359e2d64bab7


#criar o deploymet
kubectl delete service/service-appconverter-temperatura
kubectl delete deployment/deployment-appconverter-temperatura 

kubectl apply -f deployment.yaml


kubectl get all 

