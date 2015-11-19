Content-Type: multipart/mixed; boundary="===============8406628604503528778=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86, perf] 7aba70e47c: BUG: unable to handle kernel paging request at 696d2f62
Date: Thu, 19 Nov 2015 08:38:58 +0800
Message-ID: <87mvuavn4t.fsf@yhuang-dev.intel.com>
In-Reply-To: <20151118162742.GH3816@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8406628604503528778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Peter,

Peter Zijlstra <peterz@infradead.org> writes:

> On Wed, Nov 18, 2015 at 02:33:00PM +0800, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/co=
re
>> commit 7aba70e47ca4e961acb5af96d5127e3fad651c7c ("x86, perf: Optimize st=
ack walk user accesses")
>
> Of course, that commit no longer exists. I re-create the tree every time
> I push it, this means that if you report something a few days later, its
> highly likely its against non-existant commits :/

I am sorry about this.  We will try our best to reach real 0day
reporting.

>> [   21.984049] BUG: unable to handle kernel paging request at 696d2f62
>> [   21.986759] IP: [<4110c023>] perf_prepare_sample+0xcc/0x51d
>> [   21.987859] *pdpt =3D 0000000001a93001 *pde =3D 0000000000000000 =

>> [   21.988015] Oops: 0000 [#1] PREEMPT =

>> [   21.988015] Modules linked in:
>> [   21.988015] CPU: 0 PID: 496 Comm: trinity-main Not tainted 4.3.0-0114=
7-g7aba70e #1
>
> That doesn't actually look like something the fingered patch touches.
> And seeing how its trinity triggering it, I suspect bisection fail.

Thanks for reminding, we will check the bisection process.

Best Regards,
Huang, Ying

--===============8406628604503528778==--

