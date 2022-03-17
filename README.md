# User Tested Keyboards
- [Keychron K2](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/9)
- [Keychron K1 SE](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/9)
- [Keychron K6](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/9)
- [Keychron C2](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/12)
- [Keychron K8](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/9)
- [Ninja87BT](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/13)
- [Keychron K4](https://github.com/adam-savard/keychron-k2-function-keys-linux/issues/14)

---

# Enable Function Keys On Keychron/Various Mechanical Keyboards Under Linux, with `systemd`
## (or, disable pesky media keys)


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

```shell
[Unit]
Description=Disables media keys for the Keychron K2 and enables function keys

[Service]
Type=oneshot
ExecStart=/bin/bash -c "echo 0 > /sys/module/hid_apple/parameters/fnmode"

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

## Closing Remarks

If you want to simply drag/drop the file that you create manually in the steps provided, I have it under the scripts folder in this repo. Download it and drop it in `/etc/systemd/system/`, doing Step 3 at the end.
