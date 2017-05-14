Content-Type: multipart/mixed; boundary="===============0107720354262850903=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, page_alloc] d34b0733b4: will-it-scale.per_thread_ops -4% regression
Date: Sun, 14 May 2017 13:48:27 +0800
Message-ID: <20170514054827.GA4386@yexl-desktop>
In-Reply-To: <20170512092450.fei3kvihmyf7easx@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0107720354262850903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/12, Mel Gorman wrote:
>On Fri, May 12, 2017 at 12:47:23PM +0800, kernel test robot wrote:
>> =

>> Greeting,
>> =

>> We noticed a -4% regression of will-it-scale.per_thread_ops due to commi=
t:
>> =

>> commit: d34b0733b452ca3ef1dee36436dab08b8aa6a85c ("Revert "mm, page_allo=
c: only use per-cpu allocator for irq-safe requests"")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>> =

>> in testcase: will-it-scale
>> on test machine: 256 threads Phi with 96G memory
>> with following parameters:
>> =

>> 	nr_task: 100%
>> 	mode: thread
>> 	test: page_fault2
>> 	cpufreq_governor: performance
>> =

>> test-description: Will It Scale takes a testcase and runs it from 1 thro=
ugh to n parallel copies to see if the testcase will scale. It builds both =
a process and threads based test in order to see any differences between th=
e two.
>> test-url: https://github.com/antonblanchard/will-it-scale
>> =

>
>Regrettably, this is a regression that cannot be avoided. The revert remov=
es
>an optimisation that has consequences for network-intensive workloads.
>The whole idea needs to be revisited and the revert was the safest
>option for 4.11.

Thanks for the explanation.

Xiaolong
>
>-- =

>Mel Gorman
>SUSE Labs

--===============0107720354262850903==--

