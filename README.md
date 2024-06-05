# HaltOPing

Halt server on failed ping(s)

<p align="center">
    <img src="./img/haltoping_logo.jpg" width="500"/>
</p>

## Purpose

Due to the mad behavior of my neighbor, I experience power outages nearly every day.

My small UPS cannot handle blackouts lasting several hours, resulting in my home lab servers struggling to maintain operation. To date, this has resulted in the failure of several hard disk drives. Given that my UPS is as unsophisticated as a wine cork, I cannot depend on any form of external automation for assistance.

The most straightforward solution I’ve devised is to continuously ping a specific target—my main router in this instance—and initiate a graceful shutdown of the server if the ping attempts fail.

## Usage

Only one argument is required: the target to ping.
=========

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://vshymanskyy.github.io/StandWithUkraine)
=========
