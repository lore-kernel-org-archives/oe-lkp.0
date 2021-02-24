Content-Type: multipart/mixed; boundary="===============5112591903015286784=="
MIME-Version: 1.0
From: Alexey Gladkov <gladkov.alexey@gmail.com>
To: lkp@lists.01.org
Subject: Re: d28296d248: stress-ng.sigsegv.ops_per_sec -82.7% regression
Date: Wed, 24 Feb 2021 19:38:28 +0100
Message-ID: <20210224183828.j6uut6sholeo2fzh@example.org>
In-Reply-To: <m1czwpl83q.fsf@fess.ebiederm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5112591903015286784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 10:54:17AM -0600, Eric W. Biederman wrote:
> kernel test robot <oliver.sang@intel.com> writes:
> =

> > Greeting,
> >
> > FYI, we noticed a -82.7% regression of stress-ng.sigsegv.ops_per_sec du=
e to commit:
> >
> >
> > commit: d28296d2484fa11e94dff65e93eb25802a443d47 ("[PATCH v7 5/7] Reimp=
lement RLIMIT_SIGPENDING on top of ucounts")
> > url: https://github.com/0day-ci/linux/commits/Alexey-Gladkov/Count-rlim=
its-in-each-user-namespace/20210222-175836
> > base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftes=
t.git next
> >
> > in testcase: stress-ng
> > on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz w=
ith 112G memory
> > with following parameters:
> >
> > 	nr_threads: 100%
> > 	disk: 1HDD
> > 	testtime: 60s
> > 	class: interrupt
> > 	test: sigsegv
> > 	cpufreq_governor: performance
> > 	ucode: 0x42e
> >
> >
> > In addition to that, the commit also has significant impact on the
> > following tests:
> =

> Thank you.  Now we have a sense of where we need to test the performance
> of these changes carefully.

One of the reasons for this is that I rolled back the patch that changed
the ucounts.count type to atomic_t. Now get_ucounts() is forced to use a
spin_lock to increase the reference count.

-- =

Rgrds, legion

--===============5112591903015286784==--

