export def main [] {
  let selection = (
    ["Lock", "Suspend", "Log out", "Reboot", "Shutdown (Power Off)"] 
    | str join "\n" 
    | tofi --prompt "power: "
  )

  match $selection {
    $sel if ($sel | str contains "Lock") => { swaylock },
    $sel if ($sel | str contains "Suspend") => { systemctl suspend },
    $sel if ($sel | str contains "Log out") => { niri msg action quit },
    $sel if ($sel | str contains "Reboot") => { systemctl reboot },
    $sel if ($sel | str contains "Shutdown (Power Off)") => { systemctl poweroff },
    _ => { }
  }
}
