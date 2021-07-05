Content-Type: multipart/mixed; boundary="===============6395196937566156553=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [ide] b7fb14d3ac: EIP:ioread32_rep
Date: Mon, 05 Jul 2021 13:00:09 -0700
Message-ID: <CAHk-=wj_Gfqkdp+K3iCiqMjAZQK_BrRWDs2eOS_BAw=bB=CdRw@mail.gmail.com>
In-Reply-To: <20210705125756.GA25141@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============6395196937566156553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 5, 2021 at 5:58 AM Christoph Hellwig <hch@lst.de> wrote:
>
> This looks very obviously caused by the fact that this test before
> used the old IDE driver and now uses libata.  And I have to admit I'm
> pretty lost at the magic of the iomap indirection and x86 rep prefixed
> ioport instructions.  Adding some folks that might understand the
> OOPS output..

"rep insl" is a fairly simple instruction. It just does multiple
(count in %ecx)  32-bit PIO "in" instructions from one PIO address (in
%edx), and writes the result to memory at %edi (generally
incrementing, although you can set the DF flag to write backwards in
memory, which would be insane and is never done in practice).

So in this case, you have

        rep insl (%dx),%es:(%rdi)               <-- trapping instruction

which is a bogus disassembly because it's been disassembled as if it
was 64-bit code, but it's close enough apart from the register name
(it should be %edi, not %rdi).

And we have:

    ECX: 00000080
    EDX: 00000170
    EDI: fffb9ec0
    EFLAGS: 00010002

which is all normal: DF is clear, the source IO port is 0x170, the
count is 128 (32-bit words, remember) which means that it's still has
512 bytes to go, which presumably means that it failed on the very
first access.

And the failure is because %edi points to fffb9ec0, which while a
_possible_ address does look like garbage.

Now, the only *odd* part here is the oops report:

     BUG: unable to handle page fault for address: fffba000

because that "fffba000" address looks wrong. It *should* have faulted
at that address fffb9ec0 in %edi. What I suspect is going on is that
this part of the thing is actually a qemu bug, and  what happens is
that qemu sees that "oh, 512-byte 'rep insl'" and then does a emulated
512-byte disk sector read, and when it then copies those 512 bytes to
fffb9ec0, it takes a fault on the next page, and reports that as the
faulting address. But it never updated the registers for the partially
succeeding IO.

IOW, the 512-byte transfer should have written four bytes@a time to
the range fffb9ec0 -> fffba0c0, and the fault should have happened at
the page crossing at fffba000. But %edi and %ecx should have been
updated to reflect the part that *did* work, and they haven't.

So there is a qemu bug there, in the report, in that clearly the page
fault error reporting happens incorrectly.

That said, the way to trigger that qemu bug is likely that there _is_
some problem in the kernel, because it's certainly never valid to have
that kind of odd "try to rep;insl into a non-existing page". So I
think the qemu device emulation bug is a symptom, not the cause, of
the problem.

Of course, it's entirely possible that if qemu is bad at emulating
"rep insl" instructions, it did something wrong on a previous
iteration and didn't update the registers correctly, which then caused
the problem when the rep insl continued.

So it's _possible_ that this whole thing is entirely on qemu. That
sounds unlikely: a "rep movs" that doesn't fault is what the kernel
norm should be, and I'd expect qemu to handle that full 512-byte case
perfectly well.

To summarize: to me it looks like ata_pio_sector() is using the wrong
target address. It's in this code:

        /* do the actual data transfer */
        buf =3D kmap_atomic(page);
        ap->ops->sff_data_xfer(qc, buf + offset, qc->sect_size, do_write);
        kunmap_atomic(buf);

and that "kmap_atomic()" does explain the odd high virtual address,
but it really looks like the range

   (buf + offset), qc->sect_size

ends up being more than the one page that kmap_atomic() mapped.

In particular, it looks like "offset" is those low 12 bits of the
address in %edi, ie 0xec0. And qc->sect_size is 512, so the
sff_data_xfer() ends up trying to transferr past the one page that
kmap_atomic() mapped.

Of course, I have no idea how a sector transfer would ever not be
512-byte aligned in memory.

It might perhaps be worth adding some kind of

     WARN_ON_ONCE(offset & 511);

in the callchain somewhere for that ata_queued_cmd(). But at that
point I no longer know the code.

             Linus
--===============6395196937566156553==--

