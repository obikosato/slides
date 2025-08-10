.PHONY: browse html pdf clean copy-images

MARP_CONFIG := .marprc.yml
MARP_PORT := 8080

browse: copy-images
	@echo "Starting Marp server on port $(MARP_PORT)..."
	@marp --config $(MARP_CONFIG) --server --port $(MARP_PORT) & \
	server_pid=$$!; \
	echo "Waiting for server to start..."; \
	until nc -z localhost $(MARP_PORT); do \
		sleep 1; \
	done; \
	echo "Server is ready, opening browser..."; \
	open http://localhost:$(MARP_PORT); \
	wait $${server_pid}

html: copy-images
	marp --config $(MARP_CONFIG)

pdf: copy-images
	marp --config $(MARP_CONFIG) --pdf

copy-images:
	@./copy-assets.sh

# 生成されたファイルを削除
clean:
	rm -rf dist/
