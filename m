Content-Type: multipart/mixed; boundary="===============2976113607998483399=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [locking/rwsem] 4f23dbc1e6: reaim.jobs_per_min -37.0% regression
Date: Mon, 24 Jun 2019 15:45:03 -0400
Message-ID: <f0381605-e266-4816-653a-91c6e17ca3a5@redhat.com>
In-Reply-To: <20190624054511.GA7221@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2976113607998483399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/24/19 1:45 AM, kernel test robot wrote:
> Greeting,
>
> FYI, we noticed a -37.0% regression of reaim.jobs_per_min due to commit:
>
>
> commit: 4f23dbc1e657951e5d94c60369bc1db065961fb3 ("locking/rwsem: Impleme=
nt lock handoff to prevent lock starvation")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/core
>
> in testcase: reaim
> on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz wit=
h 64G memory
> with following parameters:
>
> 	runtime: 300s
> 	nr_task: 7000t
> 	test: shared_memory
> 	cpufreq_governor: performance
> 	ucode: 0x42e
>
> test-description: REAIM is an updated and improved version of AIM 7 bench=
mark.
> test-url: https://sourceforge.net/projects/re-aim-7/

With 7000 users, there will be extreme contention on the rwsems. The
lock handoff patch is known to reduce throughput with such level of lock
contention. This is a tradeoff between throughput and fairness. I don't
think this is a problem unless some real world workloads also have
significant regression in performance. I will try to reproduce the
regression and see if we can do something to reduce the performance
regression.

Cheers,
Longman



--===============2976113607998483399==--

