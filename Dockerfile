from bryandollery/aws-cli-alpine

copy --from=alpine/helm:latest /usr/bin/helm /usr/local/bin/helm
copy --from=lachlanevenson/k8s-kubectl:latest /usr/local/bin/kubectl /usr/local/bin/kubectl
copy --from=hashicorp/packer:latest /bin/packer /usr/local/bin/packer
copy --from=hashicorp/terraform:latest /bin/terraform /usr/local/bin/terraform

run curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh | bash && \
    echo "alias ll='ls -gAlF'" >> /root/.bash_aliases && \
    echo "alias vi='vim'" >> /root/.bash_aliases && \
    git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform && \
    git clone https://github.com/hashivim/vim-packer.git ~/.vim/pack/plugins/start/vim-packer && \
    git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/plugins/start/vim-fugitive && \
    git clone https://github.com/towolf/vim-helm.git ~/.vim/pack/plugins/start/vim-helm && \
    git clone https://github.com/martinda/Jenkinsfile-vim-syntax.git ~/.vim/pack/plugins/start/jenkinsfile && \
    terraform -install-autocomplete && \
    packer -autocomplete-install && \
    apk add --no-cache less

entrypoint ["/bin/bash"]
