Content-Type: multipart/mixed; boundary="===============3095251235562149200=="
MIME-Version: 1.0
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/cpu_entry_area] 10043e02db: kernel_BUG_at_arch/x86/mm/physaddr.c
Date: Thu, 28 Dec 2017 19:01:41 +0300
Message-ID: <5cac9d39-dc2e-e671-cd16-ad32e014fd27@virtuozzo.com>
In-Reply-To: <CACT4Y+aEMHEYVF+XW_BwUJUY215Xy_t4vv4vwRzOw5YfzkiBgA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3095251235562149200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/27/2017 09:12 PM, Dmitry Vyukov wrote:

>>
>> Not really a problem caused by the patch above, it's merily exposing a c=
ode
>> path which relies blindly on "enough memory available" assumptions.
>>
>> Throwing more memory at the VM makes the problem go away...
> =

> Hi Thomas,
> =

> We just need a check inside of early_alloc() to properly diagnose such
> situation, right?
> KASAN allocates 1/8 of physical memory, so the code has _some_ logic
> behind it. But I guess it runs into a corner case where 1/8 is somehow
> larger than 1 :)
> =


We may simply don't have 1/8 available. And we actually need slightly more
than 1/8. Kernel image is present in 2 locations (direct mapping/kernel map=
ping)
so at least ram/8 + kernel_size/8. The same for cpu_entry_area. Plus some m=
emory
to build page tables.
And note that kernel_size could be hundreds of megabytes.

--===============3095251235562149200==--

