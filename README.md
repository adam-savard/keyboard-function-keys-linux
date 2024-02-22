
# Enable Function Keys On Keychron/Various Mechanical Keyboards Under Linux, with `systemd`

Below, you'll find the steps required to create a systemd command that will run at boot to disable the media keys and restore f1-f12 functionality.

## Step 1

Open a terminal window and enter the following command:

```shell
# Set the EDITOR variable with EDITOR=nano, uncommenting the line directly below
# EDITOR=nano
sudoedit /etc/systemd/system/keychron.service
```

## Step 2

Paste the following into the window:

```
[Unit]
Description=Disable media keys and substitute in function keys

[Service]
Type=simple
RemainAfterExit=yes
ExecStart=/bin/bash -c "echo 0 > /sys/module/hid_apple/parameters/fnmode"
ExecStop=/bin/bash -c "echo 1 > /sys/module/hid_apple/parameters/fnmode"

[Install]
WantedBy=multi-user.target
```

Press `ctrl+o` and then `ctrl+x` to exit.

## Step 3

In the terminal, type the following:

`systemctl enable keychron`

## Step 4

That's it! A reboot, and you'll see that the function keys have been re-enabled.
Alternatively, run this command to see the changes right away:
`systemctl start keychron`

# Contributing

If you confirm that your keyboard works with this script as expected, create a ticket and I'll add it to the list of user-tested keyboards. Alternatively, submit a PR with a modification to this readme.

# User Tested Keyboards
- [Keychron K2](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/9)
- [Keychron K1 SE](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/9)
- [Keychron K6](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/9)
- [Keychron C2](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/12)
- [Keychron K8](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/9)
- [Ninja87BT](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/13)
- [Keychron K4](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/14)
- [Keychron C1](https://github.com/adam-savard/keyboard-function-keys-linux/issues/19)
- [Flesports MK870](https://github.com/adam-savard/keyboard-function-keys-linux/issues/21)
- [Keebmonkey 1800/James Donkey RS2](https://github.com/adam-savard/keyboard-function-keys-linux/issues/20)
- [Keychron K3E1](https://github.com/adam-savard/keyboard-function-keys-linux/issues/23)

## Closing Remarks

If you want to simply drag/drop the file that you create manually in the steps provided, I have it under the scripts folder in this repo. Download it and drop it in `/etc/systemd/system/`, doing Step 3 at the end.
