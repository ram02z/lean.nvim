.PHONY: docgen nvim lint test

SETUP = "lua require'lean'.setup{}"

nvim:
	nvim --noplugin -u scripts/minimal_init.lua -c $(SETUP) $(ARGS)

docgen:
	nvim --headless --noplugin -u scripts/minimal_init.lua -c "luafile ./scripts/gendocs.lua" -c "qa"

test:
	nvim --headless --noplugin -u scripts/minimal_init.lua -c "PlenaryBustedDirectory lua/tests/ { minimal_init = './scripts/minimal_init.lua' }"

coverage:
	$(MAKE) LEAN_NVIM_COVERAGE=1 test
	luacov
	cat luacov.report.out

install-luacov:
	luarocks --lua-version 5.1 install --tree luapath/ luacov
	@echo Run 'make coverage' now to enable coverage collection.

lint:
	pre-commit run --all-files
