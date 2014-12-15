Content-Type: multipart/mixed; boundary="===============2825250470378762480=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [genirq] c291ee62216:
Date: Mon, 15 Dec 2014 15:25:24 +0100
Message-ID: <alpine.DEB.2.11.1412151220330.16494@nanos>
In-Reply-To: <1418627248.5745.186.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2825250470378762480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Dec 2014, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
> commit c291ee622165cb2c8d4e7af63fffd499354a23be ("genirq: Prevent proc ra=
ce against freeing of irq descriptors")
> =

> testbox/testcase/testparams: lkp-nex04/netperf/performance-300s-200%-SCTP=
_STREAM

>                            time.voluntary_context_switches
> =

>   100500 ++--------------------------------------------------------------=
---+
>          O       O                    O          O                       =
   |
>          |  O                            O          O                    =
   |
>   100000 ++           O  O  O O     O          O                         =
   |
>          |    O                  O          O          O                 =
   |
>          |          O                                                    =
   |
>    99500 ++                                                              =
   |
>          |                                                               =
   |
>    99000 ++                                                              =
   |
>          |                                                               =
   |
>          |                                                               =
   |
>    98500 ++        .*.*..                          .*.. .*..    .*..*..  =
   |
>          *..*.*..*.      *..*.*..*..*.*..*..*..*.*.    *    *..*       *.=
*..*
>          |                                                               =
   |
>    98000 ++--------------------------------------------------------------=
---+
> =

> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample

Cute. Looking at netperf source it seems to do a high frequency
readout of /proc/stat from all involved threads. Which of course
explains that the number of context switches is going up as the stuff
is going to content on the sparse_irq_mutex.

While its possible to fix^W band aid that case, I'm really not too
happy to do so just to please a wreckaged use case. High frequency
polling of /proc/stat is just asking for trouble and on larger
machines it's a complete scalability fail. Especially the interrupt
part is amazingly horrible

      for_each_irq_nr()
	for_each_possible_cpu()

Is it really required for netperf to do that stat poll in a loop or
can it be made smarter?

Btw, in that test scenario runs netserver and the test threads on the
same machine. So the utilization data is pretty useless anyway because
all threads will read more or less the same data which cannot be
correlated to a particular instance.

Thanks,

	tglx


--===============2825250470378762480==--

