acorn:
	@hash acorn 2>/dev/null || \
	curl https://get.acorn.io | sh

kubectl:
	@hash kubectl 2>/dev/null || \
	curl -LO "https://dl.k8s.io/release/$$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

kind:
	@hash kind 2>/dev/null || \
	{ curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.18.0/kind-linux-amd64; \
	chmod +x ./kind; \
	sudo mv ./kind /usr/local/bin/kind; }

cluster: kind kubectl acorn
	@kind create cluster --name acorn --config kind-ingress.yaml
	@kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

.PHONY: acorn kind kubectl cluster

