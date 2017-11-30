Content-Type: multipart/mixed; boundary="===============1604540620336183524=="
MIME-Version: 1.0
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [ 0.003333] BUG: KASAN: use-after-scope in console_unlock+0x605/0xcc0
Date: Thu, 30 Nov 2017 16:07:30 +0300
Message-ID: <ecd089a9-5ec4-c512-aa37-7e0d59b64894@virtuozzo.com>
In-Reply-To: <20171130082909.GA469@jagdpanzerIV>
List-Id: <oe-lkp.lists.linux.dev>

--===============1604540620336183524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 11/30/2017 11:29 AM, Sergey Senozhatsky wrote:
> On (11/30/17 09:16), Dmitry Vyukov wrote:
> [..]
>>> to be honest, this backtrace hardly makes any sense to me.
>>>
>>> vprintk_emit()
>>>  reserve_standard_io_resources()
>>>   __flush_tlb_all()
>>>    vprintk_emit()
>>>     __down_trylock_console_sem()
>>>      wake_up_klogd()
>>>       console_unlock()
>>>
>>> I need some help here.

.config has CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL=3Dy
It's known to cause use-after-scope problems, so printk/console code is lik=
ely
has nothing to do with the bug.



>>
>> You can try dirty patch from here:
>> https://groups.google.com/d/msg/kasan-dev/iDb5bhcMBT0/55QzwWaHAwAJ
>> It should make KASAN print the exact variable name and frame where it
>> was allocated.
> =

> would be good if Fengguang can try this out. I can't reproduce the
> problem on my x86 box (linux-next and Linus's trees both work fine
> for me with KASAN + lockdep + TRACE_IRQ).

I suspect you don't have gcc 7. That's is requirement for use-after-scope.

> 	-ss
>=20

--===============1604540620336183524==--

