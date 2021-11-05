Content-Type: multipart/mixed; boundary="===============0959311781412629390=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [objtool, x86] 134ab5bd18: leaking-addresses.proc..retpoline_sites.
Date: Fri, 05 Nov 2021 13:55:09 +0100
Message-ID: <YYUprVrDgCZ1zDV5@hirez.programming.kicks-ass.net>
In-Reply-To: <20211105060204.GD16759@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0959311781412629390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 05, 2021 at 02:02:04PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 134ab5bd1883312d7a4b3033b05c6b5a1bb8889b ("objtool,x86: Replace a=
lternatives with .retpoline_sites")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: leaking-addresses
> version: leaking-addresses-x86_64-4f19048-1_20211101
> with following parameters:
> =

> 	ucode: 0x28
> =

> =

> =

> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40=
GHz with 16G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag

What issue ?!? I'm not at all sure what this thing is trying to tell me.
--===============0959311781412629390==--

