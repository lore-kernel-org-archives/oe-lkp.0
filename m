Content-Type: multipart/mixed; boundary="===============2843532801275787941=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf evlist] 966c8c6f09: perf-sanity-tests.Merge_cpu_map.fail
Date: Mon, 18 Nov 2019 16:20:53 +0800
Message-ID: <20191118082053.GI6910@shao2-debian>
In-Reply-To: <20191114225338.GA22747@tassilo.jf.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2843532801275787941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 02:53:38PM -0800, Andi Kleen wrote:
> On Mon, Nov 11, 2019 at 08:53:54AM +0800, kernel test robot wrote:
> > FYI, we noticed the following commit (built with gcc-7):
> > =

> > commit: 966c8c6f09470a734ef8521d08b2a74c7f1378f7 ("perf evlist: Maintai=
n evlist->all_cpus")
> > https://git.kernel.org/cgit/linux/kernel/git/ak/linux-misc.git perf/sta=
t-scale-8
> > =

> > in testcase: perf-sanity-tests
> > with following parameters:
> > =

> > 	perf_compiler: gcc
> > 	ucode: 0x27
> =

> This is a user space patch. So if it causes a change in behavior in the
> kernel it was latent.
> > =

> > kern  :err   : [   62.167520] BUG: sleeping function called from invali=
d context at kernel/events/core.c:10702
> > kern  :err   : [   62.178180] in_atomic(): 1, irqs_disabled(): 0, non_b=
lock: 0, pid: 5841, name: perf
> > kern  :warn  : [   62.186425] CPU: 3 PID: 5841 Comm: perf Not tainted 5=
.4.0-rc5-00152-g966c8c6f09470 #1
> > kern  :warn  : [   62.194857] Hardware name: Dell Inc. OptiPlex 9020/0D=
NKMN, BIOS A05 12/05/2013
> > kern  :warn  : [   62.202680] Call Trace:
> > kern  :warn  : [   62.205702]  dump_stack+0x5c/0x7b
> > kern  :warn  : [   62.209581]  ___might_sleep+0x102/0x120
> > kern  :warn  : [   62.213984]  __might_fault+0x2b/0x30
> > kern  :warn  : [   62.218091]  perf_copy_attr+0x33/0x300
> > kern  :warn  : [   62.222369]  __do_sys_perf_event_open+0x87/0xcf0
> > kern  :warn  : [   62.227542]  do_syscall_64+0x5b/0x1d0
> > kern  :warn  : [   62.231742]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> =

> Also I can't really see how it could happen. The message should
> happen for an user access while holding a lock or similar.

Hi Andi,

We double checked the report, the call trace could be found in the
parent dmesg too, please ignore it.

> =

> But perf_copy_attr doesn't have any locks, or anything else
> that would forbid sleeping, and it's near the start of the
> system call.
> =

> The only thing I could think of is that some previous syscall
> leaked a preempt count.
> =

> I tried to reproduce it in a VM, but it didn't happen.

We tested it on a physical machine, maybe it can't reproduce in a vm.

> =

> Likely a bogus bisect?

The actual problem is perf-sanity-tests.Merge_cpu_map.fail, the failure
doesn't occur on the parent commit test. but it failed on this commit.

Best Regards,
Rong Chen
--===============2843532801275787941==--

