FROM gitpod/workspace-full

RUN wget https://github.com/digitalocean/doctl/releases/download/v1.93.0/doctl-1.93.0-linux-amd64.tar.gz && \
    tar xf ./doctl-1.93.0-linux-amd64.tar.gz && \
    sudo mv ./doctl /usr/local/bin/doctl && \
    rm doctl-1.93.0-linux-amd64.tar.gz

RUN curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash

RUN npm install -g add @nestjs/cli expo-cli eas-cli @expo/ngrok@^4.1 nps

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh

RUN curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64 && \
    chmod +x ./kind && \
    sudo mv ./kind /usr/local/bin/kind

RUN helm repo add bitnami https://charts.bitnami.com/bitnami

RUN wget https://github.com/stripe/stripe-cli/releases/download/v1.13.12/stripe_1.13.12_linux_x86_64.tar.gz && \
    tar -xvf stripe_1.13.12_linux_x86_64.tar.gz && \
    sudo mv stripe /usr/bin && \
    rm -r stripe_1.13.12_linux_x86_64.tar.gz

RUN curl -fsSL https://get.pulumi.com | sh

ENV PATH="~/.pulumi/bin:${PATH}"
