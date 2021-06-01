Content-Type: multipart/mixed; boundary="===============5889602224301196185=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Tue, 01 Jun 2021 10:10:01 -0700
Message-ID: <20210601171001.GN4397@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <7bda8e6a-2179-b431-973b-d074cd8d93db@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5889602224301196185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 05:58:53PM -0700, Andi Kleen wrote:
> =

> > Only those cloud provides making heavy use of the aforementioned "poorly
> > designed" hardware, correct?
> =

> If any such hardware is deployed in non homeopathic quantities, we probab=
ly
> need to support it out of the box. So far I'm not seeing any evidence that
> it does not.
> =

> That would argue for including the patch in the patch series.
> =

> Especially since stress-ng is somewhat popular for system testing.

Except that different use cases need different out-of-the-box settings.
In addition, there is a range of consequences for undesired settings
across these use cases.  Fortunately, the various distros and other kernel
delivery mechanisms act as different boxes, and can provide their chosen
out-of-box setting.

Of course, it would be better to avoid adding an additional setting.
But as we will see when considering the following use cases and
corresponding consequences, that setting needs to be to mark the
clocksource unstable if that clocksource exhibits persistent read delays,
that is, as the v15 series does -without- the out-of-tree patch.

To see this, consider the following use cases:

o	Bringup testing for new silicon, firmware, and clock drivers.
	In this case, it is critically important that any serious problem
	be unmistakably flagged.  After all, these activities are all
	too often carried out under severe time pressure, which means
	that subtle messages are likely to be ignored.  If there is a
	hardware, firmware, or driver issue that results in persistent
	delays, this issue must not be ignored.  Hence the absolute need
	to mark the clocksource unstable in this case, in order to avoid
	releasing hardware, firmware, and clock-driver bugs into the wild.

o	System test for new hardware, including multisocket hardware
	such as that denigrated by stress-ng.  Although this use case
	might prefer that clocksource read delays be ignored (as they
	would be with my out-of-tree patch [1]), there are a number of
	good-and-sufficient ways to deal with the current state of the
	v15 series [2], including marking the TSC stable, specifying HPET
	at boot time, or simply ignoring the fact that the clocksource
	gets marked unstable.

o	Applications running in production that suffer from stress-ng-like
	properties.  Such applications might well prefer that high-speed
	fine-grained clocksources not be marked unstable, but the
	workarounds for system test apply here as well.

	Furthermore, such applications are likely to perform better
	on a single-socket system than on a larger and more expensive
	multi-socket system.  Thus, marking clocksources unstable
	would be a good hint that adjustments would be helpful, whether
	these adjustments be confining such applications to lower-cost
	hardware on which they are likely to perform better, or reading
	a certain book [3] and applying its lessons in order to adjust
	the application to improve performance and scalability and to
	reduce the interference with clocksources.

o	Scalable applications running in production, as in those that do
	not suffer from stress-ng-like properties.  Any such applications
	that are sensitive to clock skew in excess of 100 microseconds
	really want the v15 series without the extra patch.  After all,
	if there is a problem with clock-related hardware, firmware,
	or device-driver bugs, it is far better to have that problem
	unambiguously diagnosed than to have to wade through strange
	and misleading application problems caused by clock skew.

	And please note that this is not a theoretical problem.
	After all, an earlier version of this series already spotted a
	very real problem that was addressed by an upgrade.

So if there is only a single out-of-the box option, it really does need
to be that provided by v15 of the patch series.  There are already
settings that can be used in the use cases that care, but if these
prove inadequate, again, I can add another setting via a new patch,
perhaps based on my out-of-tree patch.

							Thanx, Paul

[1]	https://lore.kernel.org/lkml/20210527182959.GA437082(a)paulmck-ThinkPad=
-P17-Gen-1/
[2]	https://lore.kernel.org/lkml/20210527190042.GA438700(a)paulmck-ThinkPad=
-P17-Gen-1/
[3]	https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfboo=
k/perfbook.html
--===============5889602224301196185==--

