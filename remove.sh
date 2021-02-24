#!/bin/bash
export disableServiceException=100
export deleteServiceException=101

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
echo "#Disable keychron service before delete service"
sudo systemctl disable keychron || throw $disableServiceException
echo "#Success"


echo "#Delete keychron service to /etc/systemd/service"
sudo rm /etc/systemd/system/keychron.service || throw $deleteServiceException
echo "#Success"

echo "---Remove process finish---"
)
catch || {
     # now you can handle
    case $ex_code in
        $disableServiceException)
            echo "#Failed disable keychron service"
        ;;
        $deleteServiceException)
            echo "Failed delete service"
        ;;
        *)
            echo "An unexpected exception was thrown"
            throw $ex_code # you can rethrow the "exception" causing the script to exit if not caught
        ;;
    esac
    echo "---Remove process failed---"
}