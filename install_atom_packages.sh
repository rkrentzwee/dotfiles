#!/usr/bin/env bash

# Installs common atom packages we use. This can be re-run to pull in new packages.
apm install atom-beautify
apm install auto-detect-indentation
apm install file-icons
apm install git-log
apm install highlight-selected
apm install linter
apm install linter-ruby
apm install linter-scss-lint
apm install merge-conflicts
apm install minimap
apm install minimap-highlight-selected
apm install open-recent
apm install pigments
apm install regex-railroad-diagram
apm install save-session
apm install todo-show

# Require further setup, so we run last
apm install sync-settings
echo "Please follow the instructions for setting up sync-settings and quit Atom once completed"
open -a Google\ Chrome https://atom.io/packages/sync-settings
open -a Atom -W
