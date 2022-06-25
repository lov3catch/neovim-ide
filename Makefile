run:
	docker run -itv ${PWD}:/root/.config/ --rm neovim-ide /bin/zsh
build:
	docker build . --no-cache --tag neovim-ide:latest


lov3catch/neovim-ide
# docker tag neovim_ide:latest lov3catch/neovim-ide:latest
# docker push lov3catch/neovim-ide:latest