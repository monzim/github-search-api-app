
gen:
	@echo "Generating files..."
	fvm dart run build_runner build --delete-conflicting-outputs
	@echo "Done"
gen-watch:
	@echo "Watching files for changes..."
	fvm dart run build_runner watch --delete-conflicting-outputs

gen-l10n:
	@echo "Generating l10n files..."
	fvm flutter gen-l10n
	@echo "Done"


clean:
	fvm flutter clean && fvm flutter pub get