function sted
  if test (count $argv) -eq 0
    echo "Error: No tags provided" >&2
    return 1
  end

  set -l tags $argv[1]
  set -l files (stag s $tags --files | string collect)

  if test -z "$files"
    echo "No files found for tag: $tags" >&2
    return 0
  end

  # Use fzf with file preview and path formatting
  set -l selected (echo $files | string split \n | fzf \
    --preview 'bat {}' \
    --preview-window 'right:40%' \
    --filepath-word \
    --tiebreak=end \
    --layout=reverse \
    --prompt="SED > " \
    --tac \
    --delimiter / \
    --with-nth -4..)

  if test -n "$selected"
    if test -z "$EDITOR"
      echo "Error: \$EDITOR not set" >&2
      return 1
    end
    $EDITOR "$selected"
  end
end
