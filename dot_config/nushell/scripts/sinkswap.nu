def parse_wpctl_status [] {
  let pw_data = try {
    pw-dump | from json | where { |row| $row.info? != null }
  } catch {
    return []
  }

  let default_sink_name = try {
    pactl get-default-sink | str trim
  } catch {
    return ""
  }

  let sinks = $pw_data
  | where info.props."media.class"? == "Audio/Sink"
  | each { |sink|
    let props = $sink.info.props
    {
      id: $sink.id,
      name: $props."node.name"?,
      desc: $props."node.description"?,
    }
  }

  {
    sinks: $sinks,
    default: $default_sink_name
  }
}

export def main [] {
  let data = parse_wpctl_status
  let sinks = $data.sinks
  let default = $data.default

  let menu_items = $sinks
  | each { |sink|
    if $sink.name == $default {
      $"● ($sink.desc)"
    } else {
      $sink.desc
    }
  } | str join "\n"

  let selected = ($menu_items | tofi --prompt "sink: ")
  let clean_selected = ($selected | str replace "● " "")
  let selected_sink = $sinks | where desc == $clean_selected | first

  if not ($selected_sink | is-empty) {
    pactl set-default-sink $selected_sink.name
    print $"Switched to: ($selected_sink.desc)"
  }
}
