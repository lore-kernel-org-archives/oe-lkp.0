Content-Type: multipart/mixed; boundary="===============6628422293623342726=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: 4879b7ae05 ("Merge tag 'dmaengine-4.12-rc1' of .."): WARNING: kernel stack regs at bd92bc2e in 01-cpu-hotplug:3811 has bad 'bp' value 000001be
Date: Mon, 02 Oct 2017 14:58:08 -0700
Message-ID: <CA+55aFwo4U3vHFtKyCrGaumcfCMszfS48QSxNfEC3pD5wLxQnA@mail.gmail.com>
In-Reply-To: <20171002212654.rsm4uj3hfioddldd@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============6628422293623342726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 2, 2017 at 2:26 PM, Josh Poimboeuf <jpoimboe@redhat.com> wrot=
e:
>
> The bisect is pointing to a commit which is almost 5 months old, so this
> is pre-ORC.  Kallsyms *is* enabled, but the unwinder dump isn't smart
> enough to realize it's dumping misaligned stack addresses:

Ahh, I didn't pick up on that "esp isn't aligned" part.

That said, if %esp gets unaligned at some point, it's not clear
exactly when we should align it. An unaligned stack pointer will
continue to _work_ just potentially perform fairly badly.

But more likely, we picked the wrong frame value to begin with.

For example, maybe that decode_frame_pointer() logic really should
check not that the low bit in bp is set, but instead check that it's a
valid "unsigned long *" that has the low bit set.

IOW, the difference would be that instead of checking

        if (!(regs & 0x1))
                return NULL;

if would check

        if ((regs & (sizeof(unsigned long)-1)) !=3D 1)
                return NULL;

but also maybe add logic to simply not trust a next frame pointer that
isn't appropriately aligned.

So I think adding PTR_ALIGN() there in the unwind dumper might be a
bit late. By that time it has already accepted what looks like a
garbage frame. No?

                Linus

--===============6628422293623342726==--

