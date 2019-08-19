docker build -t smurphy7/multi-client:latest -t smurphy7/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t smurphy7/multi-server:latest -t smurphy7/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t smurphy7/multi-worker:latest -t smurphy7/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push smurphy7/multi-client:latest
docker push smurphy7/multi-server:latest
docker push smurphy7/multi-worker:latest

docker push smurphy7/multi-client:$SHA
docker push smurphy7/multi-server:$SHA
docker push smurphy7/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=smurphy7/multi-client:$SHA
kubectl set image deployments/server-deployment server=smurphy7/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=smurphy7/multi-worker:$SHA