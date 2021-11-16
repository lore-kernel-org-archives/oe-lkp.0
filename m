Content-Type: multipart/mixed; boundary="===============8058005634232214527=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/asm] 0507503671: will-it-scale.per_process_ops -4.9% regression
Date: Tue, 16 Nov 2021 09:57:48 +0800
Message-ID: <2bee0a73-31e6-2430-8d20-fdc13a512d53@intel.com>
In-Reply-To: <F17C5180-EE2C-4C25-9042-078525C4604D@zytor.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8058005634232214527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 11/16/2021 5:15 AM, H. Peter Anvin wrote:
> It is perhaps a bit hard for gcc to know what S's are C so they can be E'=
d, since all it sees is assembly.
> =

> It also doesn't explain how this code
> could possibly have this kind of impact; of anything, it should make this=
 change more beneficial, not less; certainly not make it consume 5% more CP=
U.
Let's wait the test result with the performance monitor totally disabled.


Regards
Yin, Fengwei

> =

> =

> =

> On November 15, 2021 12:39:52 PM PST, Peter Zijlstra <peterz@infradead.=
org> wrote:
>> On Mon, Nov 15, 2021 at 11:20:07AM -0800, H. Peter Anvin wrote:
>>> [Cc: Peter Z.]
>>>
>>> This seems totally bizarre... that is an *enormous* change, and if I'm
>>> reading it right it seems like this somehow related to the performance
>>> monitoring framework itself?
>>>
>>> The lower-performance init code is all pushed into the pre-boot path, u=
nless
>>> for some strange reason not all code gets patched e.g. at module loading
>>> time.
>>>
>>> A quick peek around made me notice a few minor possibilities, but none =
of
>>> them look particularly sane:
>>>
>>> 1. We don't use "asm inline" in asm_volatile_goto, and we probably
>>>    should; otherwise gcc might get the idea this is a more heavyweight
>>>    operation than it actually is.
>>> 2. There is a workaround in asm_volatile_goto for a bug which apparently
>>>    was fixed in gcc 4.8.x that might mislead gcc's code generator into
>>>    generating worse code.
>>>
>>> Did you see any functions for which the code got *bigger*?
>>
>> Urgh, that code uses _4_ static_cpu_has(X86_FEATURE_ARCH_LBR) which,
>> IIRC, GCC can't CSE. I've been asking for CSE on jump-labels for a
>> while, but that's not actually got me anywhere.
>>
>> https://lore.kernel.org/all/YG80wg/2iZjXfCDJ(a)hirez.programming.kicks-a=
ss.net/?q=3Dstatic_branch%2Fjump_label+vs+branch+merging
>>
>> Let me see if I can't re-arrange that code differently.
>=20
--===============8058005634232214527==--

