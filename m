Content-Type: multipart/mixed; boundary="===============6259095526900970792=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: [ 0.003333] BUG: KASAN: use-after-scope in console_unlock+0x605/0xcc0
Date: Thu, 30 Nov 2017 15:45:24 +0100
Message-ID: <CACT4Y+Yc9MsoipEucVjQzJ1es=D7UHjupodzJE7nMuRriY=M0g@mail.gmail.com>
In-Reply-To: <20171130143006.76eebrxp5rpwdtok@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6259095526900970792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 3:30 PM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> On Thu, Nov 30, 2017 at 05:29:09PM +0900, Sergey Senozhatsky wrote:
>>
>> On (11/30/17 09:16), Dmitry Vyukov wrote:
>> [..]
>>>
>>> > to be honest, this backtrace hardly makes any sense to me.
>>> >
>>> > vprintk_emit()
>>> >  reserve_standard_io_resources()
>>> >   __flush_tlb_all()
>>> >    vprintk_emit()
>>> >     __down_trylock_console_sem()
>>> >      wake_up_klogd()
>>> >       console_unlock()
>>> >
>>> > I need some help here.
>>>
>>>
>>> You can try dirty patch from here:
>>> https://groups.google.com/d/msg/kasan-dev/iDb5bhcMBT0/55QzwWaHAwAJ
>>> It should make KASAN print the exact variable name and frame where it
>>> was allocated.
>>
>>
>> would be good if Fengguang can try this out. I can't reproduce the
>> problem on my x86 box (linux-next and Linus's trees both work fine
>> for me with KASAN + lockdep + TRACE_IRQ).
>
>
> Attached is the dmesg with Dmitry's patch. The new output is:
>
> [    0.003333] frame offset: 32
> [    0.003333] desc: '2 32 4 3 __u 96 8 3 __u '
> [    0.003333] func: console_unlock+0x0/0xcc0


Thanks for testing.
The output looks broken. There are more than 2 variables in
console_unlock. Probably it has found a wrong stack frame descriptor
on stack...
But Andrey says that use-after-scope has known false positives with
CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL=3Dy, so probably this does not
matter.

--===============6259095526900970792==--

