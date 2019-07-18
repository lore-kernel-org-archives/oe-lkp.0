Content-Type: multipart/mixed; boundary="===============1979495572632167481=="
MIME-Version: 1.0
From: Nadav Amit <namit@vmware.com>
To: lkp@lists.01.org
Subject: Re: [x86/modules] f2c65fb322: will-it-scale.per_process_ops -2.9% regression
Date: Thu, 18 Jul 2019 17:59:08 +0000
Message-ID: <52D013BF-9B4B-4D03-B56F-3F378E4A2BA4@vmware.com>
In-Reply-To: <20190718095037.GC27250@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1979495572632167481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> On Jul 18, 2019, at 2:50 AM, kernel test robot <rong.a.chen@intel.com> =
wrote:
> =

> Greeting,
> =

> FYI, we noticed a -2.9% regression of will-it-scale.per_process_ops due t=
o commit:
> =

> =

> commit: f2c65fb3221adc6b73b0549fc7ba892022db9797 ("x86/modules: Avoid bre=
aking W^X while loading modules")
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fkerne=
l.googlesource.com%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.gi=
t&amp;data=3D02%7C01%7Cnamit%40vmware.com%7Cdfe19d72eecd46a93fc508d70b65652=
b%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C636990402460329367&amp;sdata=
=3D9MHPlha0MIkDWKe%2BurDDr0QRDMtJ3pPACgDtVXy8pL4%3D&amp;reserved=3D0 master
> =

> in testcase: will-it-scale
> on test machine: 192 threads Intel(R) Xeon(R) CPU @ 2.20GHz with 192G mem=
ory
> with following parameters:
> =

> 	nr_task: 100%
> 	mode: process
> 	test: poll1
> 	cpufreq_governor: performance
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fgithub.com%2Fantonblanchard%2Fwill-it-scale&amp;data=3D02%7C01%7Cnamit=
%40vmware.com%7Cdfe19d72eecd46a93fc508d70b65652b%7Cb39138ca3cee4b4aa4d6cd83=
d9dd62f0%7C0%7C0%7C636990402460329367&amp;sdata=3DYmsJebf0t3yyo7KMCdUu6VIOy=
sebmB%2Fc7huxkOe5cV0%3D&amp;reserved=3D0

I don=E2=80=99t understand how this patch has any impact on this workload.

I ran it and set a function tracer for any function that is impacted by this
patch:

  # cd /sys/kernel/debug/tracing
  # echo text_poke_early > set_ftrace_filter
  # echo module_alloc >> set_ftrace_filter
  # echo bpf_int_jit_compile >> set_ftrace_filter
  # tail -f trace

Nothing came up. Can you please check if you see any of them invoked on your
setup? Perhaps you have some bpf filters being installed, although even then
this is a one-time (small) overhead for each process invocation.


--===============1979495572632167481==--

