---
title: Components
description: >
  The basic components that make up Campfyre.
weight: 2
---

These are the basic components that Campfyre utilizes. Each component will have
a brief description of why it was selected, and any specific requirements for
choosing a replacement. Note that only the listed components have shown to work,
and untested replacements are not guaranteed to operate (or fit) properly.

[Google Sheet link](https://docs.google.com/spreadsheets/d/19ZAjStZ-obC8wSNhDvEN2Lx9rUpaaM5_dhgU9AE4784/edit?gid=0#gid=0)
to primary component listing.

# Notes before starting

Campfyre has been designed to support 15A of load on downstream devices within
the case. Starlink takes up to 5A input, and a Raspberry Pi 5 can require up to
5A. It is recommended to use the Starlink without snow melt mode. It is also
recommended to use a Raspberry Pi 4 Model B, as Pi 5s are power-hungry and
output a lot of heat.

# Starlink Mini

Campfyre has been designed around the use of a Starlink Mini with a Roam plan.
Starlink _must_ be activated with in-motion use enabled (Roam plan), as the goal
of Campfyre is to provide internet service without a dedicated location
selected.

Make sure you turn off snow melt mode on the Starlink, otherwise it will heat up
internally and could cause damage in the sealed environment within the case.

# Power Supply & Management

These are the bread and butter of the internal architecture of Campfyre. Each
one

## 12V VBUS Power Supply

This is the main VBUS power supply that connects between the power path
controller and the downstream devices, such as the Starlink Mini and the network
switch.

The VBUS supply must accept 8-15V DC, and regulate it to an even 12V. This is to
smooth out the power from the battery, vehicle alternator/battery, or other
sources that may not deliver "clean" power.

### Requirements

- 8-15V DC in
- 12V @ 8A+ out

## 5V Power Supply

This is to provide power to the Raspberry Pi. It should accept 12V DC in, and
output 5.1V at 3A or more. Any 5V DC-DC power supply that fits your case should
work, but the one selected has been validated to work well.

### Requirements

- 12V DC in
- 5.1V @ 3A+ out

## Power Path Controller

This is the device that switches between external DC in (VIN) and the battery to
power downstream devices. It sits between the battery, VIN, and the primary VBUS
supply. It is not an easy part to find replacements for. It must be able to
switch between VIN and battery instantaneously, and must be solid-state. Relays
are too slow for power to transition smoothly, and could cut out power to
Starlink or to the Raspberry Pi.

### Requirements

- 8-15V DC in for VIN
- 8-15V DC in for battery
- 8-15V DC out for downstream devices
- Automated cutover between external DC and battery
- Handle at least 8A of current, but recommended to have a safety factor of at
  least 2

## Battery

The battery is one of the most important parts of the device. It must be able to
supply at least 8A of current, and be of _the same chemistry_ as the charger
supports.

{{% alert title="WARNING" %}} Batteries are dangerous. Large capacity ones
especially so. For Campfyre to remain safe, you _must_ purchase 12V LiFePO4
batteries. LiPo/Li-Ion batteries are not compatible, and sealed lead-acid (SLA)
batteries are also not compatible. Using a LiFePO4 charger with the wrong type
of batteries can result in an explosion. Do not charge a LiFePO4 battery at
temperatures below freezing. {{% /alert %}}

### Requirements

- 8A+ discharge current (ideally >10A)
- 12V (4S) LiFePO4 battery

## Battery Charger

The battery charger must accept 8-15V DC in and boost the voltage to standard
charging voltages for the battery you've chosen. In addition, it should support
the chemistry of the battery selected.

DC-DC battery chargers are fairly rare, and so the one selected for Campfyre has
already been validated to work with the selected battery and voltage input.

### Requirements

- 8-15V DC in
- 12V (4S) LiFePO4 battery support

# Protection

## Circuit Breakers

The circuit breakers are used to turn on and off the power inside Campfyre, and
prevent sudden spikes from causing sparks, fires, or melting wires. The circuit
breakers should be rated for 15A, and support switching under load.

### Requirements

- 24V+ DC rating
- 15A capacity rating
- B curve or better
- Switch under load

## Fuses

25A fuses should be used to protect Campfyre, and placed on both the battery
positive lead and VIN positive lead. MIDI fuses are used for ease of
installation, and ease of sourcing. It is recommended against using automotive
blade fuses.

### Requirements

- 24V+ DC rating
- 25A DC rating

## External Connectors

Campfyre uses
[Cnlinko](https://www.amazon.com/stores/page/F13776C8-E8BD-4309-9AB0-ED23CD712609)
connectors for VIN and the Ethernet jack, due to their waterproofing. Any
connector that is capable of handling 15A of current at 12V DC, though, should
be usable.

### Requirements

- 15A DC rating
- 24V+ DC rating
- 2 or 3 pin for power
- RJ45 for Ethernet
