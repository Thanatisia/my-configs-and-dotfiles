# My .config folder

Root .config folder

- Please place this folder in the [~/.config] path

## Table of Contents
Clone

## Clone

- There are 2 methods
	1. Clone whole repository
		git clone https://github.com/Thanatisia/my-configs-and-dotfiles

	2. Sparse Checkout
		- This works by specifying the specific path you want to download
		- In this case : .config
		- Please refer to my guide on sparse checkout here : [Sparse Checkout](https://github.com/Thanatisia/SharedSpace/blob/main/Docs/Git/10.%20Cloning%20a%20repository.txt)

		[Experimental]

		- mkdir .config && cd .config
		- git remote add origin https://github.com/Thanatisia/my-configs-and-dotfiles
		- git sparse-checkout init
		- git sparse-checkout set ".config"
		- git sparse-checkout list
		- git pull origin main


