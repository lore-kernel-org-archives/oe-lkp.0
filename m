Content-Type: multipart/mixed; boundary="===============4981048816345900207=="
MIME-Version: 1.0
From: Luck, Tony <tony.luck@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Tue, 18 Aug 2020 13:06:54 -0700
Message-ID: <20200818200654.GA21494@agluck-desk2.amr.corp.intel.com>
In-Reply-To: <20200818082943.GA65567@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4981048816345900207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2020 at 04:29:43PM +0800, Feng Tang wrote:
> Hi Borislav,
> =

> On Sat, Apr 25, 2020 at 03:01:36PM +0200, Borislav Petkov wrote:
> > On Sat, Apr 25, 2020 at 07:44:14PM +0800, kernel test robot wrote:
> > > Greeting,
> > > =

> > > FYI, we noticed a -14.1% regression of will-it-scale.per_process_ops =
due to commit:
> > > =

> > > =

> > > commit: 1de08dccd383482a3e88845d3554094d338f5ff9 ("x86/mce: Add a str=
uct mce.kflags field")
> > =

> > I don't see how a struct mce member addition will cause any performance
> > regression. Please check your test case.
> =

> Sorry for the late response.
> =

> We've done more rounds of test, and the test results are consistent.
> =

> Our suspect is the commit changes the data alignment of other kernel
> domains than mce, which causes the performance change to this malloc
> microbenchmark.
> =

> Without the patch, size of 'struct mce' is 120 bytes, while it will
> be 128 bytes after adding the '__u64 kflags' =

> =

> And we also debugged further:
> =

> * add "mce=3Doff" to kernel cmdline, the performance change keeps. =

> =

> * change the 'kflags' from __u64 to __u32 (the size of mce will
>   go back to 120 bytes), the performance change is gone
> =

> * only comment off '__u64 kflags', peformance change is gone.
> =

> We also tried perf c2c tool to capture some data, but the platform
> is a Xeon Phi which doesn't support it. Capturing raw HITM event
> also can not provide useful data.
> =

> 0day has reported quite some strange peformance bump like this,
>   https://lore.kernel.org/lkml/20200205123216.GO12867(a)shao2-debian/
>   https://lore.kernel.org/lkml/20200114085637.GA29297(a)shao2-debian/
>   https://lore.kernel.org/lkml/20200330011254.GA14393(a)feng-iot/
> for some of which, the bump could be gone if we hack to force all
> kernel functions to be aligned, but it doesn't work for this case.
> =

> So together with the debugging above, we thought this could be a
> data alignment change caused performance bump.

So if this was a change to a structure in some performance sensitive
path, I'd totally understand how it could end up with a 14% change on
some benchmark that stressed that code path.

But I doubt the kernel ever touches a "struct mce" during execution
of your benchmark (I presume your test machine isn't getting thousands
of corrected memory errors during the test :-) ).

We do have some DEFINE_PER_CPU data objects of type "struct mce":

$ git grep 'DEFINE_PER_CPU(struct mce,'
arch/x86/kernel/cpu/mce/core.c:static DEFINE_PER_CPU(struct mce, mces_seen);
arch/x86/kernel/cpu/mce/core.c:DEFINE_PER_CPU(struct mce, injectm);

Maybe making those slightly bigger has pushed some other per_cpu object
into an unfortunate alignment where some frequently used data is now
split between two cache lines instead of sitting in one?

Can you collect some perf trace data for the benchmark when running
on kernels with kflags as __u32 and __u64 (looks to be the minimal
possible change that you found that still exhibits this problem).

We'd like to find out which kernel functions are burning extra CPU
cycles and maybe understand why.

The answer isn't to tinker with "struct mce". Other changes could trigger
this same change in alignment. Anything that is this perfomance sensitive
needs to have some "__attribute__((aligned(64)))" (or whatever) to
make sure arbitrary changes elsewhere don't do this.

-Tony
--===============4981048816345900207==--

