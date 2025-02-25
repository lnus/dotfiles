# Edit Fish Function
function eff
  set -l functions_dir ~/.config/fish/functions
  set -l selected_function (find $functions_dir -type f | fzf)

  if test -n "$selected_function"

    set -l editor $EDITOR
    if test -z "$editor"
        echo "Error: \$EDITOR not set"
        return 1
    end

    $EDITOR $selected_function
  else
    echo "No function selected."
  end
end

