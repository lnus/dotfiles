function sed
  if test (count $argv) -eq 0
    echo "Error: No tags provided" >&2
    return 1
  end

  set -l tags $argv[1]
  set -l files (stag s $tags --files | fzf)

  if test -n "$files"
    if test -z "$EDITOR"
      echo "Error: \$EDITOR not set" >&2
      return 1
    end
    $EDITOR "$files"
  end
end
