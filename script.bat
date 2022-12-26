echo "Criando as imagens..."

docker build -t ayldson/projeto-back:1.0 backend/.
docker build -t ayldson/projeto-data:1.0 database/.

echo "Realizando push das imagens..."

docker push ayldson/projeto-back:1.0
docker push ayldson/projeto-data:1.0

echo "Criando serviços..."

kubectl apply -f ./services.yml

echo "Realizando deployment..."

kubectl apply -f ./deployment.yml

echo "Processo concluído"