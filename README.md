# HaltOPing

Halt server on failed ping(s).

<p align="center">
    <img src="./img/haltoping_logo.jpg" width="400"/>
</p>

## Purpose

Due to the mad behavior of my neighbor, I experience power outages nearly every day.

My small UPS cannot handle blackouts lasting several hours, resulting in my home lab servers struggling to maintain operation. To date, this has resulted in the failure of several hard disk drives. Given that my UPS is as unsophisticated as a wine cork, I cannot depend on any form of external automation for assistance.

The most straightforward solution I’ve devised is to continuously ping a specific target—my main router in this instance—and initiate a graceful shutdown of the server if the ping attempts fail.

## Warning
Ordinary shutdown is used (without any restart) - this is on purpose. Be aware - you need to have a way to start servers remotely. In my case - I am using Tyua smart outlets (poor-man KVM).

## Usage

### Manual/one-shot

Only one argument is required: the target to ping.

```sh
./haltoping 192.168.1.1
```

### Daemon

Install script as systemd service:

```sh
sudo bash install.sh 192.168.1.1
```

> [!NOTE]
> You can re-run install.sh with different target IP, it will reinstall script

This will copy script into `/usr/local/bin/haloping`, and start it with systemd unit `haltoping.service`.


```sh
# check status with
systemctl status haltoping

# check logs
sudo journalctl -u haltoping
```

## TODO

- [ ] prever situation when server cant recover at the boot (disable autostart?)
- [ ] install as deb package
- [ ] test systemd service
- [ ] pre-commit
- [ ] github templates

---

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://vshymanskyy.github.io/StandWithUkraine)
