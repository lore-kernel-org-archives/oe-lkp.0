Content-Type: multipart/mixed; boundary="===============8534078477001346524=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, mlock, vmscan] 7f2ca91b49: reaim.jobs_per_min -7.4% regression
Date: Thu, 04 Jan 2018 07:38:11 -0800
Message-ID: <CALvZod4jrU_GV1a6zk5z0KXC=N-rAnYziaSXjhMvNhfaU=uXdg@mail.gmail.com>
In-Reply-To: <20180102031743.GQ3172@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8534078477001346524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,

On Mon, Jan 1, 2018 at 7:17 PM, kernel test robot <xiaolong.ye@intel.com>=
 wrote:
>
> Greeting,
>
> FYI, we noticed a -7.4% regression of reaim.jobs_per_min due to commit:
>
>
> commit: 7f2ca91b498654e7e3405f1f76ac5a80c76d336e ("mm, mlock, vmscan: no =
more skipping pagevecs")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: reaim
> on test machine: 56 threads Intel(R) Xeon(R) CPU E5-2695 v3 @ 2.30GHz wit=
h 256G memory
> with following parameters:
>
>         runtime: 300s
>         nr_task: 1000
>         test: mem_rtns_1
>         cpufreq_governor: performance
>
> test-description: REAIM is an updated and improved version of AIM 7 bench=
mark.
> test-url: https://sourceforge.net/projects/re-aim-7/
>

I am not able to reproduce this issue. However I am trying to repro on
a VM with 4 vcpus and 4 GiB memory and I don't see any difference. I
am suspecting that it may repro on a larger machine but I don't have
access to one. Can you please re-run this on your machine and run
"perf record -a -g" in parallel while the actual test is running.

thanks,
Shakeel

--===============8534078477001346524==--

