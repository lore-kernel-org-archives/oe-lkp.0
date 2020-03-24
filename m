Content-Type: multipart/mixed; boundary="===============3362445932340122752=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: lkp@lists.01.org
Subject: Re: [cpufreq] 06c4d00466: will-it-scale.per_process_ops -53.4% regression
Date: Tue, 24 Mar 2020 12:24:54 +0200
Message-ID: <CAHp75VeeKZLeZ8E3Py7LECN54SPFHaRgkxrMzBYQWXM8x+4JhA@mail.gmail.com>
In-Reply-To: <20200324060124.GC11705@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3362445932340122752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 8:02 AM kernel test robot <rong.a.chen@intel.com>=
 wrote:
>
> Greeting,
>
> FYI, we noticed a -53.4% regression of will-it-scale.per_process_ops due =
to commit:

> commit: 06c4d00466eb374841bc84c39af19b3161ff6917 ("[patch 09/22] cpufreq:=
 Convert to new X86 CPU match macros")
> url: https://github.com/0day-ci/linux/commits/Thomas-Gleixner/x86-devicet=
able-Move-x86-specific-macro-out-of-generic-code/20200321-031729
> base: https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git li=
nux-next
>
> in testcase: will-it-scale
> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8=
G memory
> with following parameters:


drivers/cpufreq/speedstep-centrino.c change missed the terminator,
perhaps it's a culprit, because I don't believe removing dups and
reordering lines may affect this.
Can you restore terminator there and re-test?

-- =

With Best Regards,
Andy Shevchenko
--===============3362445932340122752==--

