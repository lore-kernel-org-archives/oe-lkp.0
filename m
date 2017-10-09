Content-Type: multipart/mixed; boundary="===============7734275675860435820=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Mon, 09 Oct 2017 23:47:57 +0800
Message-ID: <20171009154757.7mwxbglodb2b6crk@wfg-t540p.sh.intel.com>
In-Reply-To: <20171009154446.i5s5rhlwuae3jxrs@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7734275675860435820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2017 at 05:44:46PM +0200, Peter Zijlstra wrote:
>On Mon, Oct 09, 2017 at 11:41:30PM +0800, Fengguang Wu wrote:
>> > > [  187.855027] init: plymouth-splash main process (418) terminated w=
ith status 1
>> > > [  187.953296] init: networking main process (419) terminated with s=
tatus 1
>> > > [  191.697721] ------------[ cut here ]------------
>> > > [  191.699318] WARNING: CPU: 0 PID: 424 at kernel/locking/lockdep.c:=
3928 check_flags+0x119/0x1b0
>> >
>> > Would still like to get around sorting that one though.
>>
>> Sure. It looks not easy to bisect, anyway I just queued the job.
>
>Oh no worries; I'd just like to be able to reproduce locally, then I'll
>prod it with a sharp stick.

OK.

>If you could get me that userspace image somehow, that'd be grand.

It's all the same image, reproduce script and kconfig that I just sent
you in the earlier email today.

Thanks,
Fengguang

--===============7734275675860435820==--

