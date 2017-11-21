Content-Type: multipart/mixed; boundary="===============0311844861047729975=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rjw@rjwysocki.net>
To: lkp@lists.01.org
Subject: Re: [migration_cpu_stop] WARNING: CPU: 0 PID: 11 at kernel/sched/core.c:1187 set_task_cpu+0x257/0x6b6
Date: Tue, 21 Nov 2017 15:01:29 +0100
Message-ID: <2632109.ot2sBKrXJm@aspire.rjw.lan>
In-Reply-To: <20171121133403.GH3165@worktop.lehotels.local>
List-Id: <oe-lkp.lists.linux.dev>

--===============0311844861047729975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tuesday, November 21, 2017 2:34:03 PM CET Peter Zijlstra wrote:
> On Tue, Nov 21, 2017 at 08:04:20PM +0800, Fengguang Wu wrote:
> > Hello,
> > =

> > FYI this happens in mainline kernel 4.14.0-00902-g43ff2f4.
> > It happens since 4.13.
> > =

> > It occurs in 7 out of 36 boots.
> > =

> > [   58.171538] no ifx modem active;
> > [   58.211860] ACPI: Preparing to enter system sleep state S5
> > [   58.216823] reboot: Power down
> > [   58.244526] acpi_power_off called
> > [   61.460467] ------------[ cut here ]------------
> > [   61.465481] WARNING: CPU: 0 PID: 11 at kernel/sched/core.c:1187 set_=
task_cpu+0x257/0x6b6:
> > 						set_task_cpu at kernel/sched/core.c:1187
> =

> Never seen that before.. but I can't even figure out how CPUs end up
> offline in that reboot path :/
> =

> So far I just get lost in the callback maze... Rafael any clues?
> =


Nope.

We used to offline nonboot CPUs in the reboot path, but we don't seem to
be doing that any more.


--===============0311844861047729975==--

