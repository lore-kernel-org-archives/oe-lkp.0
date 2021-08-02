Content-Type: multipart/mixed; boundary="===============4395325201919299694=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [fsnotify] 4c40d6efc8: unixbench.score -3.3% regression
Date: Mon, 02 Aug 2021 12:45:49 +0200
Message-ID: <20210802104549.GA28745@quack2.suse.cz>
In-Reply-To: <CAOQ4uxhsb_iVBTWVVreS7eSRCUapFFcyhXwnekaqptbMJSm1KQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4395325201919299694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun 01-08-21 09:32:40, Amir Goldstein wrote:
> On Sat, Jul 31, 2021 at 10:51 PM Gabriel Krisman Bertazi
> <krisman@collabora.com> wrote:
> >
> > Amir Goldstein <amir73il@gmail.com> writes:
> >
> > > On Sat, Jul 31, 2021 at 9:20 AM kernel test robot <oliver.sang@inte=
l.com> wrote:
> > >>
> > >>
> > >>
> > >> Greeting,
> > >>
> > >> FYI, we noticed a -3.3% regression of unixbench.score due to commit:
> > >>
> > >>
> > >> commit: 4c40d6efc8b22b88a45c335ffd6d25b55d769f5b ("[PATCH v4 08/16] =
fsnotify: pass arguments of fsnotify() in struct fsnotify_event_info")
> > >> url: https://github.com/0day-ci/linux/commits/Gabriel-Krisman-Bertaz=
i/File-system-wide-monitoring/20210721-001444
> > >> base: https://git.kernel.org/cgit/linux/kernel/git/jack/linux-fs.git=
 fsnotify
> > >>
> > >> in testcase: unixbench
> > >> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) CPU @ 2.30GHz=
 with 128G memory
> > >> with following parameters:
> > >>
> > >>         runtime: 300s
> > >>         nr_task: 1
> > >>         test: pipe
> > >>         cpufreq_governor: performance
> > >>         ucode: 0x4003006
> > >>
> > >> test-description: UnixBench is the original BYTE UNIX benchmark suit=
e aims to test performance of Unix-like system.
> > >> test-url: https://github.com/kdlucas/byte-unixbench
> > >>
> > >> In addition to that, the commit also has significant impact on the f=
ollowing tests:
> > >>
> > >> +------------------+------------------------------------------------=
-------------------------------------+
> > >> | testcase: change | will-it-scale: will-it-scale.per_thread_ops -1.=
3% regression                        |
> > >> | test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum=
 9242 CPU @ 2.30GHz with 192G memory |
> > >> | test parameters  | cpufreq_governor=3Dperformance                 =
                                       |
> > >> |                  | mode=3Dthread                                  =
                                       |
> > >> |                  | nr_task=3D100%                                 =
                                       |
> > >> |                  | test=3Deventfd1                                =
                                       |
> > >> |                  | ucode=3D0x5003006                              =
                                       |
> > >> +------------------+------------------------------------------------=
-------------------------------------+
> > >>
> > >>
> > >> If you fix the issue, kindly add following tag
> > >> Reported-by: kernel test robot <oliver.sang@intel.com>
> > >>
> > >
> > > Gabriel,
> > >
> > > It looks like my change throws away much of the performance gain for
> > > small IO on pipes without any watches that was achieved by commit
> > > 71d734103edf ("fsnotify: Rearrange fast path to minimise overhead
> > > when there is no watcher").
> > >
> > > I think the way to fix it is to lift the optimization in __fsnotify()
> > > to the fsnotify_parent() inline wrapper as Mel considered doing
> > > but was not sure it was worth the effort at the time.
> > >
> > > It's not completely trivial. I think it requires setting a flag
> > > MNT_FSNOTIFY_WATCHED when there are watches on the
> > > vfsmount. I will look into it.
> >
> > Amir,
> >
> > Since this patch is a clean up, would you mind if I drop it from my
> > series and base my work on top of mainline? Eventually, we can rebase
> > this patch, when the performance issue is addressed.
> >
> > I ask because I'm about to send a v5 and I'm not sure if I should wait
> > to have this fixed.
> =

> I guess you mean that you want to add the sb to fsnotify() args list.
> I don't mind, it's up to Jan.

Yeah, no problem with that from my side either.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============4395325201919299694==--

