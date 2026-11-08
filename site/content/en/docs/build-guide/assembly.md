---
title: Assembly
description: >
  Begin the adventure of assembling your Campfyre.
weight: 4
---

# Assembly Instructions

## Step 1: Print & Acquire Parts and Tools

Start by printing and acquiring the parts needed for Campfyre. This includes the
tools and consumables needed to complete your build (such as screwdrivers,
heat-set inserts, sandpaper, and adhesives).

You can find all of the parts to be printed at
[https://campfyre.org/docs/build-guide/printable-parts/](https://campfyre.org/docs/build-guide/printable-parts/).

Once the printed parts are complete, install the heat-set inserts in their
respective holes using a soldering iron.

## Step 2: Install printed parts into the case

Start by sanding down the locations in the inside of the case where you will be
adhering the printed parts. The sandpaper is used to score the plastic to make
it easier for the adhesive in the tape to bond.

Then, you should clean the areas with isopropyl alcohol (IPA) and a paper towel,
to remove any debris.

Next, adhere the VHB tape onto the printed parts, and using firm pressure, stick
them down to the sanded parts of the case's interior. The exact location is not
important, with the exception of the Starlink brackets. They need to be placed
an exact distance apart, in order to hold the Starlink in place firmly.

### Starlink Bracket Installation

To install the Starlink bracket most easily, start by taping and installing one
side in the case as far to the side as reasonable. Then, place the Starlink in
the case, pressed against the bracket. Using the Starlink as a template for
where to install the second bracket, place the second bracket against the
Starlink, then stick it to the case. This should result in a tight fit, where
the Starlink will not rattle when the corners have been screwed into place.

## Step 3: Drill holes to fit the external plugs

Start by drilling the central holes for the main portion of the external plugs
(using the 24.5mm and 20.5mm drill bit), then using the plugs themselves as a
template. drill out 3mm holes for screws to hold the plugs in place.

## Step 4: Install electrical components into case

Install the DIN rail (including circuit breakers, Raspberry Pi, etc.), power
path controller, power supplies, network switch, fuses, and other components
into the case and onto their mounts.

{{% alert color="info" title="Helpful Tip" %}} Install and connect the battery
last! This will prevent an accidental power-up of the system (or fire).
{{% /alert %}}

## Step 5: Cut wires to length, then install

Start by cutting the longest wires to length, then installing their ring
terminals if applicable. Then, attach the wires according to the diagrams.

{{% alert color="info" title="Helpful Tip" %}} Start with the longest wires
first - this way, if you cut a wire too short, it can be reused later on a
shorter wire run. {{% /alert %}}

![Wiring diagram for Campfyre](/img/wires.png)

## Step 6: Test continuity

Ensure that all circuit breakers are off, then test continuity with a multimeter
between the battery's power and ground leads. There should be no connection -
this means that it is safe to connect the battery while the breakers are turned
off.

Once you have confirmed there is no continuity while the breakers are off,
disconnect the electrical loads (power supplies, power path controller, network
switch, Raspberry Pi, Starlink, battery charger, etc.) and start to turn on the
circuit breakers, followed by testing continuity. With all loads disconnected,
there should _never_ be continuity between the positive and negative leads of
the battery.

## Step 7: Connect the battery

Make sure the circuit breakers are off, then connect the battery. Start by just
touching the electrical connectors onto the battery, and make sure no sparks
occur. Once you have confirmed that the battery can be safely connected without
potential of fire (with the circuit breakers off), connect the battery fully.

{{% alert color="info" title="Helpful Tip" %}} This is the single most dangerous
step in the entire build. Be prepared to turn off the circuit breakers
immediately if there are any signs of sparks, smoke, or fire.{{% /alert %}}

## Step 8: Start powering on Campfyre

Reconnect the electrical loads, then start with the main circuit breaker that
connects the battery to the power supplies. Once turning on the breaker, the
Starlink should power up, along with the network switch and the Raspberry Pi.
The power supplies should also have a small light that turns on to say they are
being powered properly.

Once everything is powered up and connected, you can connect the external power
to the external power ports which lead into the charger. This should charge the
battery.

{{% alert color="info" title="Helpful Tip" %}} Never charge Campfyre unattended.
Batteries of all kinds are dangerous, and can catch fire without warning. Treat
electricity with respect - each of these LiFePO4 batteries carries about 45kJ of
energy, equivalent to about 10 grams of TNT. {{% /alert %}}

## Step 9: Test internet connectivity with Starlink

Open the Starlink app and test your internet connectivity. At this point, you
should be outside and able to see the sky. Once you've confirmed that your
device works, you're ready to go!
