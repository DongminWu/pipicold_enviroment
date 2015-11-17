.PHONY: default

default: 
	@echo "==================="
	@echo "  make a package"
	@echo "==================="
	mkdir -p tmp
	cp ~/.inputrc ./tmp 
	cp ~/.vimrc ./tmp 
	cp ~/.tmux.conf ./tmp 
	cp ~/.vim ./tmp  -rf
	cp ~/.indexer_files ./tmp 
	rm -f linux_dotfiles.tar 
	tar cvf linux_dotfiles.tar ./tmp 
	rm -R -f tmp 

.PHONY: extract

extract:
	mkdir -p tmp
	cp linux_dotfiles.tar tmp
	cd tmp
	tar xvf linux_dotfiles.tar
	cp ./tmp/.vim ~ -rf
	cp ./tmp/.vimrc ~ -rf
	cp ./tmp/.tmux.conf ~ -rf
	cp ./tmp/.inputrc ~ -rf
	cp ./tmp/.indexer_files ~ -rf
	rm -R -f tmp 

.PHONY: setenv

setenv:
	git config --global alias.st status
	git config --global alias.br branch
	git config --global alias.co checkout
clean:
	rm -R ./tmp
	@echo "==================="
	@echo "      Done!"
	@echo "==================="

help:
	@echo "make help > show this"
	@echo "make  > package dot files into linux_dotfiles.tar"
	@echo "make extract > extract dot files to $$HOME path"
	
