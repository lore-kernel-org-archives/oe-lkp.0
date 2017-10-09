Content-Type: multipart/mixed; boundary="===============3489682500018690711=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Mon, 09 Oct 2017 23:41:30 +0800
Message-ID: <20171009154130.2vc2mhsxxa6htuhp@wfg-t540p.sh.intel.com>
In-Reply-To: <20171009152847.kwo5ifr4lftgm6va@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3489682500018690711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>> [  187.855027] init: plymouth-splash main process (418) terminated with =
status 1
>> [  187.953296] init: networking main process (419) terminated with statu=
s 1
>> [  191.697721] ------------[ cut here ]------------
>> [  191.699318] WARNING: CPU: 0 PID: 424 at kernel/locking/lockdep.c:3928=
 check_flags+0x119/0x1b0
>
>Would still like to get around sorting that one though.

Sure. It looks not easy to bisect, anyway I just queued the job.

Regards,
Fengguang

--===============3489682500018690711==--

