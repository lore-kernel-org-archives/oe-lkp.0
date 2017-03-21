Content-Type: multipart/mixed; boundary="===============1046135232984196480=="
MIME-Version: 1.0
From: Thomas Garnier <thgarnie@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] 69218e4799: BUG:kernel_hang_in_boot_stage
Date: Tue, 21 Mar 2017 13:25:24 -0700
Message-ID: <CAJcbSZFuJiJE0=rS-ZGPLCMUgaz+dPzHUm-iMa=J1E4H0qAHFg@mail.gmail.com>
In-Reply-To: <CAJcbSZHFYz4wpBftvS40Gv9X5Epuk43wLStv9-7axWd3965fcw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1046135232984196480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The issue seems to be related to exceptions happening in close pages
to the fixmap GDT remapping.

The original page fault happen in do_test_wp_bit which set a fixmap
entry to test WP flag. If I grow the number of processors supported
increasing the distance between the remapped GDT page and the WP test
page, the error does not reproduce.

I am still looking at the exact distance between repro and no-repro as
well as the exact root cause.

On Tue, Mar 21, 2017 at 12:23 PM, Thomas Garnier <thgarnie@google.com> wr=
ote:
> On Tue, Mar 21, 2017 at 12:20 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Tue, Mar 21, 2017 at 11:16 AM, Thomas Garnier <thgarnie@google.com>=
 wrote:
>> > This error happens even with Andy TLS fix on 32-bit (GDT is on fixmap
>> > but not readonly). I am looking into it.
>> >
>> > KVM internal error. Suberror: 3
>> > extra data[0]: 80000b0e
>> > extra data[1]: 31
>>
>> If I read that right, it's extra data[1] 0x31, which EXIT_REASON_EPT_MIS=
CONFIG.
>>
>> I'm not seeing how the A bit in a GDT entry could have anything to do
>> with it. I'm assuming it happens even without Andy's patch?
>
> Correct.
>
>>
>>                   Linus
>
>
>
>
> --
> Thomas



-- =

Thomas

--===============1046135232984196480==--

