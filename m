Content-Type: multipart/mixed; boundary="===============4033116057631283293=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Tue, 18 Aug 2020 16:29:43 +0800
Message-ID: <20200818082943.GA65567@shbuild999.sh.intel.com>
In-Reply-To: <20200425130136.GA28245@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============4033116057631283293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

On Sat, Apr 25, 2020 at 03:01:36PM +0200, Borislav Petkov wrote:
> On Sat, Apr 25, 2020 at 07:44:14PM +0800, kernel test robot wrote:
> > Greeting,
> > =

> > FYI, we noticed a -14.1% regression of will-it-scale.per_process_ops du=
e to commit:
> > =

> > =

> > commit: 1de08dccd383482a3e88845d3554094d338f5ff9 ("x86/mce: Add a struc=
t mce.kflags field")
> =

> I don't see how a struct mce member addition will cause any performance
> regression. Please check your test case.

Sorry for the late response.

We've done more rounds of test, and the test results are consistent.

Our suspect is the commit changes the data alignment of other kernel
domains than mce, which causes the performance change to this malloc
microbenchmark.

Without the patch, size of 'struct mce' is 120 bytes, while it will
be 128 bytes after adding the '__u64 kflags' =


And we also debugged further:

* add "mce=3Doff" to kernel cmdline, the performance change keeps. =


* change the 'kflags' from __u64 to __u32 (the size of mce will
  go back to 120 bytes), the performance change is gone

* only comment off '__u64 kflags', peformance change is gone.

We also tried perf c2c tool to capture some data, but the platform
is a Xeon Phi which doesn't support it. Capturing raw HITM event
also can not provide useful data.

0day has reported quite some strange peformance bump like this,
  https://lore.kernel.org/lkml/20200205123216.GO12867(a)shao2-debian/
  https://lore.kernel.org/lkml/20200114085637.GA29297(a)shao2-debian/
  https://lore.kernel.org/lkml/20200330011254.GA14393(a)feng-iot/
for some of which, the bump could be gone if we hack to force all
kernel functions to be aligned, but it doesn't work for this case.

So together with the debugging above, we thought this could be a
data alignment change caused performance bump.

Thanks,
Feng

> Thx.
> =

> -- =

> Regards/Gruss,
>     Boris.
> =

> SUSE Software Solutions Germany GmbH, GF: Felix Imend=C3=B6rffer, HRB 368=
09, AG N=C3=BCrnberg
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============4033116057631283293==--

