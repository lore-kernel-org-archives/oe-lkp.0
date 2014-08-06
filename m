Content-Type: multipart/mixed; boundary="===============6217833547896681552=="
MIME-Version: 1.0
From: Nick Krause <xerofoify@gmail.com>
To: lkp@lists.01.org
Subject: Re: [setsockopt] WARNING: CPU: 0 PID: 1444 at kernel/sched/core.c:7088 __might_sleep+0x51/0x16f()
Date: Wed, 06 Aug 2014 09:52:51 -0400
Message-ID: <CAPDOMVi_b3tmSAEdhQo6UviAhi_Tx9BfjZ-jP851OSOQztN_yg@mail.gmail.com>
In-Reply-To: <20140805215434.GA10047@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============6217833547896681552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2014 at 5:54 PM, Fengguang Wu <fengguang.wu@intel.com> wro=
te:
> On Wed, Aug 06, 2014 at 05:46:24AM +0800, Fengguang Wu wrote:
>> Greetings,
>>
>> Here is a microcode/load_module error triggered by debug check commit
>
> Sorry for the copy&paste error! This warning is not related to
> microcode/load_module..
>
> Thanks,
> Fengguang
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
Hey Fenngaug,
I looking through this trace.

213 skb =3D kmem_cache_alloc_node(cache, gfp_mask & ~__GFP_DMA, node);
214 if (!skb)
215 goto out;
This lines seem to be an issue as after tracing to were you are
getting a warning,
might_sleep is written as

might_sleep_if(flags & __GFP_WAIT);
This means that the flag for GFP_WAIT is probably set and sure enough you w=
ould
be getting an error after sleeping in __alloc_skb.
Regards Nick

--===============6217833547896681552==--

