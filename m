Content-Type: multipart/mixed; boundary="===============5030598888169477652=="
MIME-Version: 1.0
From: Eric Biggers <ebiggers@kernel.org>
To: lkp@lists.01.org
Subject: Re: [fscrypt] 22d94f493b: will-it-scale.per_thread_ops 1.7% improvement
Date: Mon, 09 Mar 2020 12:09:39 -0700
Message-ID: <20200309190939.GD1073@sol.localdomain>
In-Reply-To: <20200308140241.GP5972@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5030598888169477652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 08, 2020 at 10:02:41PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a 1.7% improvement of will-it-scale.per_thread_ops due to=
 commit:
> =

> =

> commit: 22d94f493bfb408fdd764f7b1d0363af2122fba5 ("fscrypt: add FS_IOC_AD=
D_ENCRYPTION_KEY ioctl")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: will-it-scale
> on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz=
 with 192G memory
> with following parameters:
> =

> 	nr_task: 50%
> 	mode: thread
> 	test: poll2
> 	cpufreq_governor: performance
> 	ucode: 0x500002c
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale

This looks like a flaky test.  That commit shouldn't have had any effect on=
 this
performance test, either positive or negative.

- Eric
--===============5030598888169477652==--

