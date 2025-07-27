# FIXME clean up, see alt-tab.nu
# niri msg -j outputs | from json
# would be awesome here
def get_monitors [] {
  let niri_data = niri msg outputs
  | lines
  | window 2
  | where ($it.0 | str starts-with "Output ")
  | each {|pair|
    let parsed = $pair.0 | parse 'Output "{name}" ({adapter})' | get 0
    let is_disabled = ($pair.1 | str trim) == "Disabled"
    $parsed | insert disabled $is_disabled
  }

  $niri_data
}

def can_toggle_monitor [monitor_data: table, target_name: string] {
  let target_monitor = $monitor_data | where name == $target_name | first
  let enabled_count = $monitor_data | where disabled == false | length

  if $target_monitor.disabled {
    return true
  }

  $enabled_count > 1
}

export def main [] {
  let monitor_data = get_monitors
  let menu_items = $monitor_data
  | sort-by disabled
  | each { |monitor| 
    let status = if $monitor.disabled { "𐄂" } else { "✓" }
    $"($status) ($monitor.name)"
  } | str join "\n"

  let selected = ($menu_items | tofi --prompt "monitor: ")
  let clean_name = $selected | str replace --regex "^𐄂 |^✓ " ""
  let selected_monitor = $monitor_data | where name == $clean_name | first

  if not (can_toggle_monitor $monitor_data $clean_name) {
    notify-send "Cannot disable the last enabled monitor!"
    return
  }

  let action = if $selected_monitor.disabled { "enable" } else { "disable" }
  notify-send $"Toggling ($selected_monitor.adapter) to ($action)..."

  match $selected_monitor.disabled {
    true  => { niri msg output $selected_monitor.adapter on  }
    false => { niri msg output $selected_monitor.adapter off }
  }
}
