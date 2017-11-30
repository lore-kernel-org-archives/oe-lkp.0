Content-Type: multipart/mixed; boundary="===============8291946629745892777=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [ 0.003333] BUG: KASAN: use-after-scope in console_unlock+0x605/0xcc0
Date: Thu, 30 Nov 2017 17:05:49 +0800
Message-ID: <20171130090549.azhcfv3ugbtmts2g@wfg-t540p.sh.intel.com>
In-Reply-To: <20171130082909.GA469@jagdpanzerIV>
List-Id: <oe-lkp.lists.linux.dev>

--===============8291946629745892777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 05:29:09PM +0900, Sergey Senozhatsky wrote:
>On (11/30/17 09:16), Dmitry Vyukov wrote:
>[..]
>> > to be honest, this backtrace hardly makes any sense to me.
>> >
>> > vprintk_emit()
>> >  reserve_standard_io_resources()
>> >   __flush_tlb_all()
>> >    vprintk_emit()
>> >     __down_trylock_console_sem()
>> >      wake_up_klogd()
>> >       console_unlock()
>> >
>> > I need some help here.
>>
>>
>> You can try dirty patch from here:
>> https://groups.google.com/d/msg/kasan-dev/iDb5bhcMBT0/55QzwWaHAwAJ
>> It should make KASAN print the exact variable name and frame where it
>> was allocated.
>
>would be good if Fengguang can try this out. I can't reproduce the
>problem on my x86 box (linux-next and Linus's trees both work fine
>for me with KASAN + lockdep + TRACE_IRQ).

OK I'll try Dmitry's patch out.

Thanks,
Fengguang

--===============8291946629745892777==--

