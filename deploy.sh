docker build -t smurphy7/multi-client -f ./client/Dockerfile ./client
docker build -t smurphy7/multi-server -f ./server/Dockerfile ./server
docker build -t smurphy7/multi-worker -f ./worker/Dockerfile ./worker
docker push smurphy7/multi-client
docker push smurphy7/multi-server
docker push smurphy7/multi-worker
kubectl apply -f k8s
kubectl rollout restart deployment client-deployment
kubectl rollout restart deployment server-deployment
kubectl rollout restart deployment worker-deployment