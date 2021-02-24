# Enable Function Keys On The Keychron K2 Mechanical Keyboard Under Linux


Below, you'll find the steps required to create a systemd command that will run at boot to disable the media keys and restore f1-f12 functionality.

## A. Using script
1. How to install
    Open your terminal and move directory to this source code path and run:
    `bash ./install.sh`

2. How to remove
    Open your terminal and move directory to this source code path and run:
    `bash ./remove.sh`



## B. Manual step
1. Open a terminal window and enter the following command:
    `sudo nano /etc/systemd/system/keychron.service`
2. Paste the following into the window:
    ```
    [Unit]
    Description=The command to make the Keychron K2 work

    [Service]
    Type=oneshot
    ExecStart=/bin/bash -c "echo 0 > /sys/module/hid_apple/parameters/fnmode"

    [Install]
    WantedBy=multi-user.target
    ```
    Press `ctrl+o` and then `ctrl+x` to exit.

3. In the terminal, type the following:
    `systemctl enable keychron`
4. That's it! A reboot, and you'll see that the function keys have been re-enabled.

## C. Closing Remarks

If you want to simply drag/drop the file that you create manually in the steps provided, I have it under the scripts folder in this repo. Download it and drop it in `/etc/systemd/system/`, doing Step 3 at the end.
