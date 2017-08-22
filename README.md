Lorank packet forwarder builder script
======================================
This repository contains a script to build the LoRa packet forwarder for a
Lorank gateway. Originally, the Lorank shipped with a fairly complex [build and
install script](https://github.com/Ideetron/Lorank) from Ideetron. However, we
wanted to deploy our Lorank gateways using the [Salt](https://saltstack.com/)
configuration management system, so needed a simpler way to generate
just the forwarder.

Compared to the original script, this script:
 - Uses the original forwarder software, instead of the
   Ideetron-specific fork.
 - Compiles just the software, leaving the other setup (enabling SPI
   hardware, installing systemd service file) for Salt, or leaving other
   setup out.
 - Generates a tarball to be deployed by Salt.
