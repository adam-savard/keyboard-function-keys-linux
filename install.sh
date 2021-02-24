#!/bin/bash
export copyServiceException=100
export setFnModeException=101
export enableServiceException=102

function try()
{
    [[ $- = *e* ]]; SAVED_OPT_E=$?
    set +e
}

function throw()
{
    exit $1
}

function catch()
{
    export ex_code=$?
    (( $SAVED_OPT_E )) && set +e
    return $ex_code
}

function throwErrors()
{
    set -e
}

function ignoreErrors()
{
    set +e
}

try
(
echo "#Copy keychron service to /etc/systemd/service"
sudo cp ./script/keychron.service /etc/systemd/system/keychron.service || throw $copyServiceException
echo "#Success"

echo "#Enable keychron service to make it run on next boot"
sudo systemctl enable keychron || throw $enableServiceException
echo "#Success"

sudo /bin/bash -c "echo 0 > /sys/module/hid_apple/parameters/fnmode" || throw $setFnModeException

echo "---Install process finish---"
)
catch || {
     # now you can handle
    case $ex_code in
        $copyServiceException)
            echo "#Failed copy keychron service to /etc/systemd/service"
        ;;
        $enableServiceException)
            echo "Failed enable keychron service"
        ;;
        $setFnModeException)
            echo "Failed set fnmode on hid_apple module"
        ;;
        *)
            echo "An unexpected exception was thrown"
            throw $ex_code # you can rethrow the "exception" causing the script to exit if not caught
        ;;
    esac
    echo "---Install process failed---"
}
