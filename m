Content-Type: multipart/mixed; boundary="===============7801459365070191307=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/vmalloc] 5c1f4e690e: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Wed, 14 Jul 2021 16:48:16 +0800
Message-ID: <2f012f0a-11f5-ba3c-65b0-027eed5bcb98@intel.com>
In-Reply-To: <CAHk-=wj_uJayxT_6CFaGMkU5h4YYSgBhS=xYoN7iUVSs7BjnBA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7801459365070191307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 7/14/2021 3:52 AM, Linus Torvalds wrote:
> [ I've asked for this before, but I'll ask for it again.. ]
> =

> On Tue, Jul 13, 2021 at 7:06 AM kernel test robot <oliver.sang@intel.co=
m> wrote:
>>
>>
>> [  131.014885] BUG: sleeping function called from invalid context at mm/=
page_alloc.c:4992
>> [  131.019428] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 29=
28, name: trinity-c6
>> [  131.023996] no locks held by trinity-c6/2928.
>> [  131.027987] irq event stamp: 283042
>> [  131.031844] hardirqs last  enabled at (283041): [<ffffffff8643af22>] =
_raw_spin_unlock_irqrestore+0x42/0x50
>> [  131.036625] hardirqs last disabled at (283042): [<ffffffff81656d71>] =
__alloc_pages_bulk+0xae1/0xf20
>> [  131.041305] softirqs last  enabled at (281858): [<ffffffff86800623>] =
__do_softirq+0x623/0x9db
>> [  131.046157] softirqs last disabled at (281853): [<ffffffff8116dfee>] =
irq_exit_rcu+0xce/0xf0
>> [  131.050925] CPU: 0 PID: 2928 Comm: trinity-c6 Not tainted 5.13.0+ #1
>> [  131.055391] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.12.0-1 04/01/2014
>> [  131.060133] Call Trace:
>> [  131.064110]  dump_stack+0xa5/0xe6
>> [  131.068192]  ___might_sleep.cold+0x147/0x177
>> [  131.072324]  __alloc_pages+0x462/0x650
> =

> Btw, can I ask the kernel test robot to do the same thing I asked
> syzbot to do - namely get better backtrace annotations?

Hi Linus,

Sorry for this, we enabled COMPILE_TEST for randconfig which is conflict
with DEBUG_INFO, then "scripts/decode_stacktrace.sh" was ignored in this
case, we'll fix it asap and have a double check next time.

Best Regards,
Rong Chen


> =

> It requires debug info in the kernel (but I think DEBUG_INFO_REDUCED
> is sufficient, no need for the full one that blows sizes up a lot),
> but it makes things _soo_ much easier to read. Not just because of
> line numbers, but particularly with inlining information.
> =

> It's easy enough to do: just run the kernel output through
> "scripts/decode_stacktrace.sh".
> =

> That will also do the "Code:" line instruction disassembly, which is
> less critical, since that can be done later at any time with no loss
> of information, but it can be a convenience.
> =

>                 Linus
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
>=20
--===============7801459365070191307==--

