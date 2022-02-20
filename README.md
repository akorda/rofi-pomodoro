# rofi-pomodoro

Pomodoro implementation using [Open-Pomodoro CLI](https://github.com/open-pomodoro/openpomodoro-cli) and the [rofi](https://github.com/davatorium/rofi) application launcher.

## Installation

Download the `rofi-pomodoro.sh` script, make it an executable and run it

```bash
cd ~/bin
wget https://raw.githubusercontent.com/akorda/rofi-pomodoro/main/rofi-pomodoro.sh
chmod +x rofi-pomodoro.sh
./rofi-pomodoro.sh
```

## Integration with i3

You could integrate the rofi-pomodoro with [i3](https://i3wm.org/) tiling window manager. Add the following line the i3 configuration (e.g. `~/.config/i3/config`) file and invoke the tool using keys <kbd>$mod</kbd> + <kbd>Control</kbd> + <kbd>p</kbd>.

```text
bindsym $mod+Control+p exec --no-startup-id ~/bin/rofi-pomodoro.sh
```

## Integration with i3status

You could integrate the rofi-pomodoro with [i3status](https://github.com/i3/i3status) status bar generator. We will add a custom i3status segment using [this technique](https://github.com/i3/i3status/blob/master/contrib/any_position_wrapper.sh).

Download the `i3statusX.sh` file and make it executable.

```bash
cd ~/bin
wget https://raw.githubusercontent.com/akorda/rofi-pomodoro/main/i3statusX.sh
chmod +x i3statusX.sh
```

Add the following line to the i3status configuration (e.g. `~/.config/i3status/config`) file

```text
order += "tztime holder__pomodoro"

tztime holder__pomodoro {
  format = "holder__pomodoro"
}
```

and replace the default bar settings in i3 configuration

```
bar {
# [...] 
  status_command ~/bin/i3statusX.sh
# [...]
}
```

Reload the i3 configuration (e.g. using <kbd>$mod</kbd> + <kbd>Shift</kbd> + <kbd>r</kbd>).