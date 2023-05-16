SRC = src/
EXEC = main

defualt:
	build

run:
	moon $(SRC)/$(EXEC).moon

build:
	moonc src/

test:
	build
	busted

watch:
	moonc -w $(SRC)

lint:
	moonc -l $(SRC)

count:
	wc -l $$(git ls-files | grep 'moon$$') | sort -n | tail