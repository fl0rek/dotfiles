m4_divert(-1)
m4_changequote(`‹', `›')
m4_changecom(‹#meta›)
m4_divert(0)
# i3status configuration file.
# see "man i3status" for documentation.

# It is important that this file is edited as UTF-8.
# The following line should contain a sharp s:
# ß
# If the above line is not correctly displayed, fix your editor first!

general {
        colors = true

	color_good = "#859900"
	color_bad = "#dc322f"
	color_degraded = "#cb4b16"

	output_format = "i3bar"

        interval = 5
}

m4_ifelse(HOSTNAME, ‹tanaris›,‹
order += "disk /"
order += "ethernet enp0s31f6"
order += "volume master"
order += "cpu_temperature CPU"
order += "cpu_temperature 0"
order += "cpu_temperature 1"
order += "load"
order += "tztime local"
›)

volume master {
        format = "♪: %volume"
        format_muted = "♪: muted (%volume)"
        device = "default"
}

wireless wlp3s0 {
        format_up = "W: (%quality at %essid) %ip"
        format_down = "W: down"
}

ethernet enp0s25 {
        # if you use %speed, i3status requires root privileges
        format_up = "E: %ip (%speed)"
        format_down = "E: down"
}

battery 0 {
        format = "%status %percentage %remaining"
}

run_watch DHCP {
        pidfile = "/var/run/dhclient*.pid"
}

run_watch VPN {
        pidfile = "/var/run/vpnc/pid"
}

tztime local {
        format = "%Y-%m-%d %H:%M:%S"
}

load {
        format = "%1min %5min %15min"
}

disk "/" {
        format = "⛁ %free"
}

cpu_temperature 0 {
        format = "T₀: %degrees °C"
        path = "/sys/bus/acpi/devices/LNXTHERM:00/thermal_zone/temp"
}

cpu_temperature 1 {
        format = "T₁: %degrees °C"
        path = "/sys/bus/acpi/devices/LNXTHERM:01/thermal_zone/temp"
}

cpu_temperature CPU {
        format = "Tᶜᵖᵘ: %degrees °C"
        path = "/sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input"
}
