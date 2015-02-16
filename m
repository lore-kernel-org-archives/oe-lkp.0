Content-Type: multipart/mixed; boundary="===============4222832131776572005=="
MIME-Version: 1.0
From: Juri Lelli <juri.lelli@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/deadline] kernel BUG at kernel/sched/deadline.c:805!
Date: Mon, 16 Feb 2015 15:12:44 +0000
Message-ID: <54E208EC.6010909@arm.com>
In-Reply-To: <20150216144412.GS24151@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4222832131776572005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 16/02/15 14:44, Peter Zijlstra wrote:
> On Mon, Feb 16, 2015 at 02:08:21PM +0100, Peter Zijlstra wrote:
>> On Mon, Feb 16, 2015 at 03:38:34PM +0300, Kirill Tkhai wrote:
>>> We shouldn't enqueue migrating tasks. Please, try this one instead ;)
>>
>> Ha, we should amend that task-rq-lock loop for that. See below.
>>
>> I've not yet tested; going to try and reconstruct a .config that
>> triggers the oops.
> =

> OK, I had to remove -enable-kvm from Wu's script, otherwise the test
> would not hit the CBS limit, and then I had to remove the panic on
> softlockup because well, qemu is so slow you're going to hit that :-)
> =

> But the good news is that I could reproduce and this patch does indeed
> seem to solve it.
> =


I also tested this on top of tip, with kvm actually. So, 1019a359d3dc
seemed to reintroduce what aee38ea95419 "sched/deadline: Fix races
between rt_mutex_setprio() and dl_task_timer()" fixed. But, this patch
seems to fix it again :).

Thanks,

- Juri


--===============4222832131776572005==--

