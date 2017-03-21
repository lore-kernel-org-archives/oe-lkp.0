Content-Type: multipart/mixed; boundary="===============9190948238179452359=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] 69218e4799: BUG:kernel_hang_in_boot_stage
Date: Tue, 21 Mar 2017 16:51:21 -0700
Message-ID: <CALCETrUsJPdW7cOs7-iKmeLZufZ8hGRpyC99-H0dy0Nw-pCCSw@mail.gmail.com>
In-Reply-To: <CALCETrUJWp-99dbU0Yq08jCkf7N+N+hD_5FUVdKc+aY6fZhLmA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9190948238179452359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2017 at 3:32 PM, Andy Lutomirski <luto@amacapital.net> wr=
ote:
> On Tue, Mar 21, 2017 at 2:11 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>> On Tue, Mar 21, 2017 at 1:25 PM, Thomas Garnier <thgarnie@google.com> =
wrote:
>>> The issue seems to be related to exceptions happening in close pages
>>> to the fixmap GDT remapping.
>>>
>>> The original page fault happen in do_test_wp_bit which set a fixmap
>>> entry to test WP flag. If I grow the number of processors supported
>>> increasing the distance between the remapped GDT page and the WP test
>>> page, the error does not reproduce.
>>>
>>> I am still looking at the exact distance between repro and no-repro as
>>> well as the exact root cause.
>>
>> Hmm. Have we set the GDT limit incorrectly, somehow? The GDT *can*
>> cover 8k entries, which at 8 bytes each would be 64kB.
>
> The QEMU barf says the GDT limit is 0xff, for better or for worse.
>
>>
>> So somebody trying to load an invalid segment (say, 0xffff) might end
>> up causing an access to the GDT base + 64k - 8.
>>
>> It is also possible that the CPU might do a page table writability
>> check *before* it does the limit check. That would sound odd, though.
>> Might be a CPU errata.
>>
>

> There's presumably something genuinely wrong with our GDT.

This is suspicious.  I added this code in test_wp_bit:

    if (memcmp(get_current_gdt_ro(), get_current_gdt_rw(), 4096) !=3D 0) {
        pr_err("Oh crap\n");
        BUG_ON(1);
    }

It printed "Oh crap" and blew up.  Methinks something's wrong with the
fixmap.  Is it possible that we're crossing a PMD boundary and failing
to translate the addresses right?

--===============9190948238179452359==--

