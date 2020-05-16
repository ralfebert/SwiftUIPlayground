FORMATTER_OPTIONS = --swiftversion 5.2 --stripunusedargs unnamed-only --self insert --disable blankLinesAtStartOfScope,blankLinesAtEndOfScope --ifdef no-indent

format:
	swiftformat --header "// SwiftUIPlayground" $(FORMATTER_OPTIONS) SwiftUIPlayground*
