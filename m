Content-Type: multipart/mixed; boundary="===============0853284586293447046=="
MIME-Version: 1.0
From: Saravana Kannan <saravanak@google.com>
To: lkp@lists.01.org
Subject: Re: [driver core] e2ae9bcc4a: unixbench.score -2.2% regression
Date: Wed, 19 Aug 2020 22:07:53 -0700
Message-ID: <CAGETcx9mctL_51Cgq9rWQuQhPpRixfqCt8fp4jyH0MP-Eg4p=w@mail.gmail.com>
In-Reply-To: <20200819070530.GJ18179@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0853284586293447046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2020 at 12:06 AM kernel test robot
<rong.a.chen@intel.com> wrote:
>
> Greeting,
>
> FYI, we noticed a -2.2% regression of unixbench.score due to commit:
>
>
> commit: e2ae9bcc4aaacda04edb75c4eea93384719efaa5 ("driver core: Add suppo=
rt for linking devices during device addition")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
>
> in testcase: unixbench
> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz with=
 192G memory
> with following parameters:
>
>         runtime: 300s
>         nr_task: 1
>         test: syscall
>         cpufreq_governor: performance
>         ucode: 0x5002f01
>
> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench
>
> In addition to that, the commit also has significant impact on the follow=
ing tests:
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/1/debian-10.4-x86_64-20200603.cgz/300=
s/lkp-csl-2sp8/syscall/unixbench/0x5002f01
>
> commit:
>   372a67c0c5 ("driver core: Add fwnode_to_dev() to look up device from fw=
node")
>   e2ae9bcc4a ("driver core: Add support for linking devices during device=
 addition")

I'm ignoring this report for the following reasons:
1. These commits are almost a year old.
2. Code added by these commits have been changed quite a bit since
them to make them faster.
3. And most importantly, this code is effectively a NOP in a system
without devicetree firmware. I'm fairly certain this x86 Xeon system
isn't running off a DT firmware :)

-Saravana
--===============0853284586293447046==--

