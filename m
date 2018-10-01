Content-Type: multipart/mixed; boundary="===============4294053054116099227=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [fsnotify] 60f7ed8c7c: will-it-scale.per_thread_ops -5.9% regression
Date: Mon, 01 Oct 2018 11:32:49 +0200
Message-ID: <20181001093249.GD3913@quack2.suse.cz>
In-Reply-To: <CAOQ4uxiHkufAtt87bMs9n-0sFxJSHsBxDX6jn8v28vkvy=a_qQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4294053054116099227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun 30-09-18 12:00:46, Amir Goldstein wrote:
> On Sun, Sep 30, 2018 at 9:50 AM kernel test robot <rong.a.chen@intel.co=
m> wrote:
> >
> > Greeting,
> >
> > FYI, we noticed a -5.9% regression of will-it-scale.per_thread_ops due =
to commit:
> >
> >
> > commit: 60f7ed8c7c4d06aeda448c6da74621552ee739aa ("fsnotify: send path =
type events to group with super block marks")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> >
> > in testcase: will-it-scale
> > on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz w=
ith 64G memory
> > with following parameters:
> >
> >         nr_task: 16
> >         mode: thread
> >         test: unlink2
> >         cpufreq_governor: performance
> >
> > test-description: Will It Scale takes a testcase and runs it from 1 thr=
ough to n parallel copies to see if the testcase will scale. It builds both=
 a process and threads based test in order to see any differences between t=
he two.
> > test-url: https://github.com/antonblanchard/will-it-scale
> >
> >
> >
> > Details are as below:
> > -----------------------------------------------------------------------=
--------------------------->
> >
> >
> > To reproduce:
> >
> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp install job.yaml  # job file is attached in this email
> >         bin/lkp run     job.yaml
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/t=
estcase:
> >   gcc-7/performance/x86_64-rhel-7.2/thread/16/debian-x86_64-2018-04-03.=
cgz/lkp-bdw-ep3d/unlink2/will-it-scale
> >
> > commit:
> >   1e6cb72399 ("fsnotify: add super block object type")
> >   60f7ed8c7c ("fsnotify: send path type events to group with super bloc=
k marks")
> >
> =

> I have to admit this looks strange.
> All this commit does is dereference mnt->mnt.mnt_sb and then
> sb->s_fsnotify_mask/sb->s_fsnotify_marks to find that they are zero.
> AFAICT there should be no extra contention added by this commit and it's
> hard to believe that parallel unlink workload would suffer from this chan=
ge.

Well, it could be those additional fetches of
sb->s_fsnotify_mask/sb->s_fsnotify_marks if they happen to be cache cold.
Or it could be just code layout differences (i.e., compiler is not able to
optimize resulting code as good or the code layout just happens to align
with cache lines in a wrong way or something like that). Anyway, without
being able to reproduce this and do detailed comparison of perf profiles I
don't think we'll be able to tell.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============4294053054116099227==--

