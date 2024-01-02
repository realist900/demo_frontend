host:
	@flutter build web -t 'lib/main.dart'
	@firebase deploy --only hosting

gen:
	@echo "\033[32m Генерация файлов... \033[0m"
	@dart run build_runner build --delete-conflicting-outputs

init:
	@echo "\033[32m Run flutter pub get... \033[0m"
	@flutter pub get
	@echo "\033[32m Генерация файлов... \033[0m"
	@dart run build_runner build --delete-conflicting-outputs
	@echo "\033[32m Done \033[0m"
