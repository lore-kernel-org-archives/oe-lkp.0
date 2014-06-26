Content-Type: multipart/mixed; boundary="===============1174829338764822066=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 7c66b15f870: +1.8% turbostat.Pkg_W
Date: Wed, 25 Jun 2014 21:00:47 -0700
Message-ID: <20140626040047.GU4603@linux.vnet.ibm.com>
In-Reply-To: <20140626021809.GA14734@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============1174829338764822066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2014 at 10:18:09AM +0800, Fengguang Wu wrote:
> On Wed, Jun 25, 2014 at 07:10:23PM -0700, Paul E. McKenney wrote:
> > On Thu, Jun 26, 2014 at 09:33:08AM +0800, Fengguang Wu wrote:
> > > Hi Paul,
> > > =

> > > We noticed increased power consumption in our internal merge commit.
> > > It's not a direct evidence, however in the hope you can see any
> > > obvious clues. :)
> > =

> > Hello, Fengguang,
> > =

> > This particular branch is obsolete, and has been replaced by commit
> > 4a81e8328d37 (Reduce overhead of cond_resched() checks for RCU).
> =

> Ah great, we happen to have more direct numbers for that patch. :)
> =

> > Just out of curiosity, how do you measure the power consumption?
> =

> It's read by the turbostat tool, from CPU MSRs:

OK, thank you for the info.  I would trust a physical power-line sensor
more, but then again, I am picky.  ;-)

							Thanx, Paul

> commit 889facbee3e67dbc8eb29d8ee7fd66d33a647bfc
> Author:     Len Brown <len.brown@intel.com>
> AuthorDate: Thu Nov 8 00:48:57 2012 -0500
> Commit:     Len Brown <len.brown@intel.com>
> CommitDate: Fri Nov 30 01:09:44 2012 -0500
> =

>     tools/power turbostat: v3.0: monitor Watts and Temperature
> =

>     Show power in Watts and temperature in Celsius
>     when hardware support is present.
> =

>     Intel's Sandy Bridge and Ivy Bridge processor generations support RAPL
>     (Run-Time-Average-Power-Limiting).  Per the Intel SDM
>     (Intel=C2=AE 64 and IA-32 Architectures Software Developer Manual)
>     RAPL provides hardware energy counters and power control MSRs
>     (Model Specific Registers).  RAPL MSRs are designed primarily
>     as a method to implement power capping.  However, they are useful
>     for monitoring system power whether or not power capping is used.
> =

>     In addition, Turbostat now shows temperature from DTS
>     (Digital Thermal Sensor) and PTM (Package Thermal Monitor) hardware,
>     if present.
> =

>     As before, turbostat reads MSRs, and never writes MSRs.
> =

>     New columns are present in turbostat output:
> =

>     The Pkg_W column shows Watts for each package (socket) in the system.
>     On multi-socket systems, the system summary on the 1st row shows the =
sum
>     for all sockets together.
> =

>     The Cor_W column shows Watts due to processors cores.
>     Note that Core_W is included in Pkg_W.
> =

>     The optional GFX_W column shows Watts due to the graphics "un-core".
>     Note that GFX_W is included in Pkg_W.
> =

>     The optional RAM_W column on server processors shows Watts due to DRA=
M DIMMS.
>     As DRAM DIMMs are outside the processor package, RAM_W is not include=
d in Pkg_W.
> =

>     The optional PKG_% and RAM_% columns on server processors shows the %=
 of time
>     in the measurement interval that RAPL power limiting is in effect on =
the
>     package and on DRAM.
> =

>     Note that the RAPL energy counters have some limitations.
> =

>     First, hardware updates the counters about once every milli-second.
>     This is fine for typical turbostat measurement intervals > 1 sec.
>     However, when turbostat is used to measure events that approach
>     1ms, the counters are less useful.
> =

>     Second, the 32-bit energy counters are subject to wrapping.
>     For example, a counter incrementing 15 micro-Joule units
>     on a 130 Watt TDP server processor could (in theory)
>     roll over in about 9 minutes.  Turbostat detects and handles
>     up to 1 counter overflow per measurement interval.
>     But when the measurement interval exceeds the guaranteed
>     counter range, we can't detect if more than 1 overflow occured.
>     So in this case turbostat indicates that the results are
>     in question by replacing the fractional part of the Watts
>     in the output with "**":
> =

>     Pkg_W  Cor_W GFX_W
>       3**    0**   0**
> =

>     Third, the RAPL counters are energy (Joule) counters -- they sum up
>     weighted events in the package to estimate energy consumed.  They are
>     not analong power (Watt) meters.  In practice, they tend to under-cou=
nt
>     because they don't cover every possible use of energy in the package.
>     The accuracy of the RAPL counters will vary between product generatio=
ns,
>     and between SKU's in the same product generation, and with temperatur=
e.
> =

>     turbostat's -v (verbose) option now displays more power and thermal c=
onfiguration
>     information -- as shown on the turbostat.8 manual page.
>     For example, it now displays the Package and DRAM Thermal Design Powe=
r (TDP):
> =

>     cpu0: MSR_PKG_POWER_INFO: 0x2f064001980410 (130 W TDP, RAPL 51 - 200 =
W, 0.045898 sec.)
>     cpu0: MSR_DRAM_POWER_INFO,: 0x28025800780118 (35 W TDP, RAPL 15 - 75 =
W, 0.039062 sec.)
>     cpu8: MSR_PKG_POWER_INFO: 0x2f064001980410 (130 W TDP, RAPL 51 - 200 =
W, 0.045898 sec.)
>     cpu8: MSR_DRAM_POWER_INFO,: 0x28025800780118 (35 W TDP, RAPL 15 - 75 =
W, 0.039062 sec.)
> =

>     Signed-off-by: Len Brown <len.brown@intel.com>
> ---
>  tools/power/x86/turbostat/turbostat.8 | 103 ++++--
>  tools/power/x86/turbostat/turbostat.c | 643 ++++++++++++++++++++++++++++=
++++--
>  2 files changed, 690 insertions(+), 56 deletions(-)
> =



--===============1174829338764822066==--

