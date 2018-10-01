Content-Type: multipart/mixed; boundary="===============6756261294988967321=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [fsnotify] 60f7ed8c7c: will-it-scale.per_thread_ops -5.9% regression
Date: Mon, 01 Oct 2018 11:25:49 +0200
Message-ID: <20181001092549.GC3913@quack2.suse.cz>
In-Reply-To: <CAOQ4uxgqBgYiGpf_6zrZk=L2bAQsujzcFE0ZzUXFHu8AnHSk7g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6756261294988967321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun 30-09-18 12:16:45, Amir Goldstein wrote:
> On Sun, Sep 30, 2018 at 12:00 PM Amir Goldstein <amir73il@gmail.com> wr=
ote:
> >
> > On Sun, Sep 30, 2018 at 9:50 AM kernel test robot <rong.a.chen@intel.=
com> wrote:
> > >
> > > Greeting,
> > >
> > > FYI, we noticed a -5.9% regression of will-it-scale.per_thread_ops du=
e to commit:
> > >
> > >
> > > commit: 60f7ed8c7c4d06aeda448c6da74621552ee739aa ("fsnotify: send pat=
h type events to group with super block marks")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> > >
> > > in testcase: will-it-scale
> > > on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz=
 with 64G memory
> > > with following parameters:
> > >
> > >         nr_task: 16
> > >         mode: thread
> > >         test: unlink2
> > >         cpufreq_governor: performance
> > >
> > > test-description: Will It Scale takes a testcase and runs it from 1 t=
hrough to n parallel copies to see if the testcase will scale. It builds bo=
th a process and threads based test in order to see any differences between=
 the two.
> > > test-url: https://github.com/antonblanchard/will-it-scale
> > >
> > >
> > >
> > > Details are as below:
> > > ---------------------------------------------------------------------=
----------------------------->
> > >
> > >
> > > To reproduce:
> > >
> > >         git clone https://github.com/intel/lkp-tests.git
> > >         cd lkp-tests
> > >         bin/lkp install job.yaml  # job file is attached in this email
> > >         bin/lkp run     job.yaml
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test=
/testcase:
> > >   gcc-7/performance/x86_64-rhel-7.2/thread/16/debian-x86_64-2018-04-0=
3.cgz/lkp-bdw-ep3d/unlink2/will-it-scale
> > >
> > > commit:
> > >   1e6cb72399 ("fsnotify: add super block object type")
> > >   60f7ed8c7c ("fsnotify: send path type events to group with super bl=
ock marks")
> > >
> >
> > I have to admit this looks strange.
> > All this commit does is dereference mnt->mnt.mnt_sb and then
> > sb->s_fsnotify_mask/sb->s_fsnotify_marks to find that they are zero.
> > AFAICT there should be no extra contention added by this commit and it's
> > hard to believe that parallel unlink workload would suffer from this ch=
ange.
> >
> > I will try to install lkp-tests to verify this on my own system, but
> > until proven
> > otherwise I will regard this as false positive.
> >
> =

> Actually, is it possible to ask for a private test with the following pat=
ch
> to optimize out an unneeded srcu_derefence().
> This optimization (assuming it is correct) could in fact improve scaling
> compared to upstream, because there are already 2 calls to
> fsnotify_first_mark in the code. The blamed commit just adds a 3rd one.

I'd be surprised if your patch actually changed anything. On x86,
srcu_dereference(foo) is just READ_ONCE(foo) and that is just a syntactic
suggar around foo to make sure compiler really fetches the value from
memory to a register only once... But it's probably worth a try.

> I am assuming that() in the test there is an fsnotify mount mark (maybe s=
etup
> by systemd) otherwise, the optimization in line 351 would have not reached
> the extra fsnotify_first_mark() call.
> Can you confirm or disprove the assumption that an fanotify mount mark
> is present during the test?

This would be good to know.

								Honza

> ----
> diff --git a/fs/notify/fsnotify.c b/fs/notify/fsnotify.c
> index 422fbc6dffde..8d45d82e09ff 100644
> --- a/fs/notify/fsnotify.c
> +++ b/fs/notify/fsnotify.c
> @@ -246,6 +246,9 @@ static struct fsnotify_mark
> *fsnotify_first_mark(struct fsnotify_mark_connector
>         struct fsnotify_mark_connector *conn;
>         struct hlist_node *node =3D NULL;
> =

> +       if (!*connp)
> +               return NULL;
> +
>         conn =3D srcu_dereference(*connp, &fsnotify_mark_srcu);
>         if (conn)
>                 node =3D srcu_dereference(conn->list.first, &fsnotify_mar=
k_srcu);
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============6756261294988967321==--

