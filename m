Content-Type: multipart/mixed; boundary="===============3922355347707188375=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [cpufreq] 06c4d00466: will-it-scale.per_process_ops -53.4% regression
Date: Tue, 24 Mar 2020 08:38:46 -0700
Message-ID: <406e39aa9890d4d518a2259b539858d82f4d6e18.camel@linux.intel.com>
In-Reply-To: <CAHp75VeeKZLeZ8E3Py7LECN54SPFHaRgkxrMzBYQWXM8x+4JhA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3922355347707188375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-03-24 at 12:24 +0200, Andy Shevchenko wrote:
> On Tue, Mar 24, 2020 at 8:02 AM kernel test robot <
> rong.a.chen(a)intel.com> wrote:
> > Greeting,
> > =

> > FYI, we noticed a -53.4% regression of will-it-
> > scale.per_process_ops due to commit:
> > commit: 06c4d00466eb374841bc84c39af19b3161ff6917 ("[patch 09/22]
> > cpufreq: Convert to new X86 CPU match macros")
> > url: =

> > https://github.com/0day-ci/linux/commits/Thomas-Gleixner/x86-devicetabl=
e-Move-x86-specific-macro-out-of-generic-code/20200321-031729
> > base: =

> > https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git
> > linux-next
> > =

> > in testcase: will-it-scale
> > on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz
> > with 8G memory
> > with following parameters:
> =

> drivers/cpufreq/speedstep-centrino.c change missed the terminator,
> perhaps it's a culprit, because I don't believe removing dups and
> reordering lines may affect this.
> Can you restore terminator there and re-test?

This is a Ivy Bridge. So if it has to do anything cpufreq then it is
not loading the cpufreq driver (intel_pstate or acpi_cpufreq).
What is
 cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor


>=20

--===============3922355347707188375==--

