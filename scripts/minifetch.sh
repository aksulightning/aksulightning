#!/usr/bin/env bash

# tinyfetch - minimal Linux system info

USER_NAME="${USER:-$(whoami)}"
HOST_NAME="$(hostname)"
OS="$(. /etc/os-release && echo "$PRETTY_NAME")"
KERNEL="$(uname -r)"
ARCH="$(uname -m)"
CPU="$(lscpu | awk -F: '/Model name/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')"
GPU="$(lspci | awk -F': ' '/VGA compatible controller|3D controller|Display controller/ {print $2; exit}')"
MEM="$(free -h | awk '/^Mem:/ {print $3 " / " $2}')"

echo "$USER_NAME@$HOST_NAME"
echo "------------------------"
echo "OS:      $OS"
echo "Kernel:  $KERNEL"
echo "Arch:    $ARCH"
echo "CPU:     $CPU"
echo "GPU:     $GPU"
echo "Memory:  $MEM"
