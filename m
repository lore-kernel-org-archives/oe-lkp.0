Content-Type: multipart/mixed; boundary="===============8758743217631821949=="
MIME-Version: 1.0
From: Yonghong Song <yhs@fb.com>
To: lkp@lists.01.org
Subject: Re: [bpf] af7ec13833: will-it-scale.per_process_ops -2.5% regression
Date: Mon, 29 Jun 2020 08:10:49 -0700
Message-ID: <cb4cab43-8f13-dd2a-5c58-855d93c6e790@fb.com>
In-Reply-To: <20200628085032.GT5535@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8758743217631821949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/28/20 1:50 AM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -2.5% regression of will-it-scale.per_process_ops due t=
o commit:
> =

> =

> commit: af7ec13833619e17f03aa73a785a2f871da6d66b ("bpf: Add bpf_skc_to_tc=
p6_sock() helper")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

One of previous emails claims that
     commit: 492e639f0c222784e2e0f121966375f641c61b15 ("bpf: Add =

bpf_seq_printf and bpf_seq_write helpers")
is reponsible for 2.5% improvement for will-it-scale.per_process_ops, =

which I believe is false.

This commit should not cause regression.

Probably the variation of performance is caused by test environment =

which you may want to investigate further to reduce false alarming.
Thanks!

> =

> in testcase: will-it-scale
> on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz=
 with 192G memory
> with following parameters:
> =

> 	nr_task: 16
> 	mode: process
> 	test: mmap1
> 	cpufreq_governor: performance
> 	ucode: 0x5002f01
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> Details are as below:
[...]
--===============8758743217631821949==--

