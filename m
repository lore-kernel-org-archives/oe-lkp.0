Content-Type: multipart/mixed; boundary="===============1606845253689498867=="
MIME-Version: 1.0
From: Alexey Gladkov <gladkov.alexey@gmail.com>
To: lkp@lists.01.org
Subject: Re: d28296d248: stress-ng.sigsegv.ops_per_sec -82.7% regression
Date: Thu, 25 Feb 2021 21:36:57 +0100
Message-ID: <20210225203657.mjhaqnj5vszna5xw@example.org>
In-Reply-To: <m17dmxl2qa.fsf@fess.ebiederm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1606845253689498867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 12:50:21PM -0600, Eric W. Biederman wrote:
> Alexey Gladkov <gladkov.alexey@gmail.com> writes:
> =

> > On Wed, Feb 24, 2021 at 10:54:17AM -0600, Eric W. Biederman wrote:
> >> kernel test robot <oliver.sang@intel.com> writes:
> >> =

> >> > Greeting,
> >> >
> >> > FYI, we noticed a -82.7% regression of stress-ng.sigsegv.ops_per_sec=
 due to commit:
> >> >
> >> >
> >> > commit: d28296d2484fa11e94dff65e93eb25802a443d47 ("[PATCH v7 5/7] Re=
implement RLIMIT_SIGPENDING on top of ucounts")
> >> > url: https://github.com/0day-ci/linux/commits/Alexey-Gladkov/Count-r=
limits-in-each-user-namespace/20210222-175836
> >> > base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kself=
test.git next
> >> >
> >> > in testcase: stress-ng
> >> > on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GH=
z with 112G memory
> >> > with following parameters:
> >> >
> >> > 	nr_threads: 100%
> >> > 	disk: 1HDD
> >> > 	testtime: 60s
> >> > 	class: interrupt
> >> > 	test: sigsegv
> >> > 	cpufreq_governor: performance
> >> > 	ucode: 0x42e
> >> >
> >> >
> >> > In addition to that, the commit also has significant impact on the
> >> > following tests:
> >> =

> >> Thank you.  Now we have a sense of where we need to test the performan=
ce
> >> of these changes carefully.
> >
> > One of the reasons for this is that I rolled back the patch that changed
> > the ucounts.count type to atomic_t. Now get_ucounts() is forced to use a
> > spin_lock to increase the reference count.
> =

> Which given the hickups with getting a working version seems justified.
> =

> Now we can add incremental patches on top to improve the performance.

I'm not sure that get_ucounts() should be used in __sigqueue_alloc() [1].
I tried removing it and running KASAN tests that were failing before. So
far, I have not found any problems.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git/tree/k=
ernel/signal.c?h=3Dpatchset/per-userspace-rlimit/v7.1&id=3D2d4a2e2be7db42c9=
5acb98abfc2a9b370ddd0604#n428

-- =

Rgrds, legion

--===============1606845253689498867==--

