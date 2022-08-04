# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
from libqtile import qtile
from libqtile import bar, layout, widget, hook, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen, KeyChord
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

# Autostart programs
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])


mod = "mod4"
terminal = guess_terminal()

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    # Open terminal. You can choose your terminal changing the variable
    # terminal from guess_terminal to one of your choice.
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key(
        [mod],
        "d",
        lazy.run_extension(
            extension.J4DmenuDesktop(
                background="#282828",
                foreground="#377375",
                selected_background="#282828",
                selected_foreground="#ebd403",
                dmenu_font="Binchotan_Sharp Nerd Font-20",
                dmenu_lines=39,
                # dmenu_prompt='Choose Application',
            )
        ),
    ),
    # Programs shortcuts
    Key([mod, "control"], "1", lazy.spawn("brave-browser"), desc="Launch Chromium"),
    Key([mod, "control"], "2", lazy.spawn("nautilus"), desc="Nautilus File Manager"),
    Key(
        [mod, "control"],
        "3",
        lazy.spawn("terminator -e ranger"),
        desc="Ranger CLI File Manager",
    ),
    Key(
        [mod, "control"],
        "4",
        lazy.spawn(terminal + " -e 'sudo ranger'"),
        desc="Ranger CLI File Manager",
    ),
]

groups = [
    Group("1", matches=[Match(wm_class=["Terminator"])], label=""),
    Group("2", matches=[Match(wm_class=["brave-browser"])], label=""),
    Group("3", matches=[Match(wm_class=["Org.gnome.Nautilus"])], label=""),
    Group("4", matches=[Match(wm_class=["DesktopEditors","wpspdf","et","wps","wpp"])], label="", layout="stack"),
    Group("5", matches=[Match(wm_class=["code"])], label=""),
    Group("6", label=""),
    Group("7", label="塞"),
    Group("8", matches=[Match(wm_class=["vlc"])], label="嗢"),
    Group("9", matches=[Match(wm_class=["sayonara"])], label=""),
    Group("0", matches=[Match(wm_class=["arandr","lxappearance","synaptic"])
          ], label=""),
]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    layout.MonadTall(
        border_focus="#fbf0c9",
        border_normal="282828",
        margin=10,
        single_margin=10,
        border_width=3,
    ),
    # layout.Max(border_focus="#fbf0c9",
    #                  border_normal = "282828",
    #                  margin = 3,
    #                  border_width=3),
    # Try more layouts by unleashing below layouts.
    layout.Stack(
        num_stacks=1,
        border_focus="#fbf0c9",
        border_normal="282828",
        margin=10,
        border_width=3,
    ),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Binchotan_Sharp Nerd Font",
    fontsize=18,
    foreground="#fbf0c9",
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox(
                    active="#e6d4a3",
                    borderwidth=2,
                    this_current_screen_border="#377375",
                    urgent_border="#be0f17",
                ),
                                widget.TextBox("",
                                    foreground = '#377375',
                                    fontsize=24),
                
                 # widget.CurrentLayoutIcon(
                 #       custom_icon_paths = [os.path.expanduser("~/.config/qtile/layout")],
                 #       foreground = "#dd2482",
                 #       scale = 0.5,
                 #       ),
                
                widget.CurrentLayout(),
                widget.TextBox("",
                    foreground = '#377375',
                    fontsize=24),
                
                widget.WindowName(),
                widget.TextBox("",
                    foreground = '#377375',
                    fontsize=24),
                
                widget.CheckUpdates(
                       update_interval = 60,
                       distro = "Ubuntu",
                       display_format = " {updates} ",
                       no_update_string = "",
                       colour_have_updates = "#be0f17",
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + " -e 'sudo apt update; apt list --upgradable; $SHELL'"),
                                          'Button3': lambda: qtile.cmd_spawn(terminal + " -e 'sudo apt upgrade -y; sudo apt autopurge -y; sudo refresh snap'")},
                       ),
                widget.TextBox("",
                    foreground = '#377375',
                    fontsize=24),
                widget.TextBox("",
                    foreground = "#fabd2f",
                    padding=5,
                    ),
                
                widget.CPU(
                        format='{load_percent}%',
                        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + " -e htop")},
                        ),
                widget.TextBox("",
                    foreground = '#377375',
                    fontsize=24),
                
                widget.TextBox("",
                    padding=5,
                    foreground = "#fe8019",
                    ),
                
                widget.Memory(
                        format='{MemPercent}%',
                        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + " -e htop")},
                        ),
                widget.TextBox("",
                    foreground = '#377375',
                    fontsize=24),
                
                widget.TextBox("",
                    foreground = "#8ec07c",
                    padding=5,
                    ),
                
                widget.DF(
                        format='{r:0.1f}%',
                        partition='/',
                        visible_on_warn=False,
                        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + " -e 'df -hT; $SHELL'")},
                        ),
                widget.TextBox("",
                    foreground = '#377375',
                    fontsize=24),
                widget.TextBox("",
                    padding=5,
                    foreground = "#83a598",
                    ),
                
                widget.Clock(
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + " -e tty-clock")},
                        format="%I:%M%p"),
                widget.TextBox("",
                    foreground = '#377375',
                    fontsize=24),
                
                widget.Systray(),
                widget.TextBox("",
                    foreground = '#377375',
                    fontsize=24),
                
                widget.Volume(
                       channel='Master',
                       foreground='#d8dde9',
                       theme_path = '/home/eddie/.config/qtile/volume',
                       #emoji=True,
                       ),
                widget.QuickExit(
                    countdown_format = '[{}s]',
                    default_text = '⏻ ',
                    foreground = 'EF2929',
                    ),
            ],
            30,
            background="#282828",
            border_width=[0, 0, 0, 0],  # Draw top and bottom borders
            border_color=[
                "fbf0c9",
                "000000",
                "fbf0c9",
                "000000",
            ],  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
