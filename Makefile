.PHONY: default

default: 
	@echo "==================="
	@echo "  make a package"
	@echo "==================="
	mkdir -p tmp
	cp ~/.inputrc ./tmp 
	cp ~/.vimrc ./tmp 
	cp ~/.tmux.conf ./tmp 
	cp -R -f ~/.vim ./tmp  
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
	cp -R -f ./tmp/.vim ~ 
	cp ./tmp/.vimrc ~ 
	cp ./tmp/.tmux.conf ~ 
	cp ./tmp/.inputrc ~ 
	cp ./tmp/.indexer_files ~ 
	rm -R -f tmp 
clean:
	rm -R ./tmp
	@echo "==================="
	@echo "      Done!"
	@echo "==================="

help:
	@echo "make help > show this"
	@echo "make  > package dot files into linux_dotfiles.tar"
	@echo "make extract > extract dot files to $$HOME path"
	
