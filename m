Content-Type: multipart/mixed; boundary="===============2001828401537270276=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [printk] 7f7c60e066: BUG:KASAN:slab-out-of-bounds
Date: Mon, 30 Oct 2017 19:47:04 -0700
Message-ID: <CAGXu5jJk3nm98URfa+r-HwHA_qH-GOTrHCahDup4u17HiGcORA@mail.gmail.com>
In-Reply-To: <20171031023938.GE12341@eros>
List-Id: <oe-lkp.lists.linux.dev>

--===============2001828401537270276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2017 at 7:39 PM, Tobin C. Harding <me@tobin.cc> wrote:
> On Mon, Oct 30, 2017 at 05:14:59PM -0700, Kees Cook wrote:
>> On Wed, Oct 25, 2017 at 9:22 AM, kernel test robot
>> <xiaolong.ye@intel.com> wrote:
>
> thanks for looking at this, I was at a loss as to what (if any) action I
> needed to take.

I have finally learned after several instances that if 0day produces a
report, it's real. :) Even the crazy stuff I haven't been able to
reproduce on my own has come back to bite me later, so now I'm very
attentive to 0day report. ;)

>> > FYI, we noticed the following commit (built with gcc-4.9):
>> >
>> > commit: 7f7c60e0663645e757e520245606fde9c6e326bb ("printk: hash addres=
ses printed with %p")
>> > url: https://github.com/0day-ci/linux/commits/Tobin-C-Harding/printk-h=
ash-addresses-printed-with-p/20171024-231922
>>
>> It's not clear to me which of the various versions this test ran
>> against, but it seems like the printf self-tests got very confused by
>> the results:
>>
>> > [   40.275423] test_printf: kvasprintf(..., "%p %p", ...) returned '3c=
f9adbe eff717bf', expected '0000000001234567 fffffffffedcba98'
>> > [   40.296739] test_printf: vsnprintf(buf, 256, "|%-*p|%*p|", ...) ret=
urned 19, expected 39
>> > [   40.322776] test_printf: vsnprintf(buf, 16, "|%-*p|%*p|", ...) retu=
rned 19, expected 39
>> > [   40.334834] test_printf: vsnprintf(buf, 0, "|%-*p|%*p|", ...) retur=
ned 19, expected 39
>>
>> I assume v10 will fix the width issues, but probably not the value tests=
...
>
> Oh, so I need to update lib/test_printf.c to cover hashed %p.

Yeah, looks like it.

>> And it claims a use-after-free, too:
>>
>> > [   39.757461] The buggy address belongs to the object at 22cb34bb
>> > [   39.757461]  which belongs to the cache kmalloc-32 of size 32
>> > [   39.757461] The buggy address is located 0 bytes inside of
>> > [   39.757461]  32-byte region [22cb34bb, 24ac3a60)
>>
>> Which becomes rather unreadable, since the address got hashed. :P
>
> So I think we need to patch mm/kasan/report to use %pK instead of %p.

Yeah, looks like it.

> I don't know what I should be doing about
>
> [   39.757461] BUG: KASAN: slab-out-of-bounds in __test+0xee/0x13f

Yeah, I have no idea where this error came from. It does seem
triggered by the printf self-test code, though, so if a KASAN bulid
doesn't show it, maybe a full SLAB DEBUG build will?

-Kees

-- =

Kees Cook
Pixel Security

--===============2001828401537270276==--

