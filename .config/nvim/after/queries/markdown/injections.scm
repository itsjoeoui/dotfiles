; extends
((inline) @injection.content
  (#match? @injection.content "^\\(import\\|export\\)\\s")
  (#set! injection.language "tsx"))
