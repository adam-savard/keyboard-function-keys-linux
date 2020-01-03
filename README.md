# Enable Function Keys On The Keychron K2 Mechanical Keyboard Under Linux


Below, you'll find the steps required to create a systemd command that will run at boot to diable the media keys and restor f1-f12 functionality.

## Step 1

Open a terminal window and enter the following command:

`sudo nano /etc/systemd/system/keychron.service`

## Step 2

Paste the following into the window:

```[Unit]
Description=The command to make the Keychron K2 work

[Service]
Type=oneshot
ExecStart=echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode

[Install]
WantedBy=multi-user.target
```

Press `ctrl+o` and then `ctrl+x` to exit.

## Step 3

In the terminal, type the following:

`systemctl enable keychron`

## Step 4

That's it! A reboot, and you'll see that the function keys have been re-enabled.

## Closing Remarks

If you want to simply drag/drop the file that you create manually in the steps provided, I have it under the scripts folder in this repo, or you can download it [here](https://github.com/adam-savard/keychron-k2-function-keys-linux/releases/download/1.0/keychron.service). Download it and drop it in `/etc/systemd/system/`, doing Step 3 at the end.
