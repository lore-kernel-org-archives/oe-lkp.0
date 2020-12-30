Content-Type: multipart/mixed; boundary="===============7352493352587367219=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [kasan] 97593cad00: RIP:kasan_record_aux_stack
Date: Wed, 30 Dec 2020 12:49:45 -0800
Message-ID: <CAHk-=wgGVoa0jzo5CmtHHmAD44qX+aaa6GOEATiABPKh3Lh5Xg@mail.gmail.com>
In-Reply-To: <20201230031436.GB22185@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7352493352587367219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 29, 2020 at 6:59 PM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
> [  235.553325] BUG: sleeping function called from invalid context at arch=
/x86/mm/fault.c:1351
> [  235.554684] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 751=
5, name: trinity-c1
> [  235.555890] 2 locks held by trinity-c1/7515:
> [  235.556506]  #0: ffffffff8323dd38 (&ids->rwsem){....}-{3:3}, at: semct=
l_down+0x6d/0x686
> [  235.557684]  #1: ffff888128ccc868 (&mm->mmap_lock#2){....}-{3:3}, at: =
do_user_addr_fault+0x196/0x59e
> [  235.559020] CPU: 1 PID: 7515 Comm: trinity-c1 Not tainted 5.10.0-g9759=
3cad003c #2
> [  235.560317] Call Trace:
> [  235.560767]  dump_stack+0x7d/0xa3
> [  235.561371]  ___might_sleep+0x2c4/0x2df
> [  235.562063]  ? do_user_addr_fault+0x196/0x59e
> [  235.562834]  do_user_addr_fault+0x234/0x59e
> [  235.563519]  exc_page_fault+0x70/0x8b
> [  235.564112]  asm_exc_page_fault+0x1b/0x20

Btw, I wonder if the kernel test robot dumps could be please run through the

 scripts/decode_stacktrace.sh

script to give line numbers and inlining information?

That does require CONFIG_DEBUG_INFO to work, but it would help things
like this when you don't have to try to guess where the exact access
happens.

Now, in this case, it seems to be a recursive issue with the original
fault happening in:

> [  235.564754] RIP: 0010:kasan_record_aux_stack+0x64/0x74

And yeah, that explains why it then bisects to 97593cad003c ("kasan:
sanitize objects when metadata doesn't fit")

The faulting instruction sequence decodes to

  10:   48 39 f3                cmp    %rsi,%rbx
  13:   48 0f 46 f3             cmovbe %rbx,%rsi
  17:   e8 6f e5 ff ff          callq  .. something ..
  1c:   bf 00 08 00 00          mov    $0x800,%edi
  21:   48 89 c3                mov    %rax,%rbx
  24:*  8b 40 08                mov    0x8(%rax),%eax           <--
trapping instruction
  27:   89 43 0c                mov    %eax,0xc(%rbx)

and I *think* that "call something" is the call to
kasan_get_alloc_meta. And there is no check for a NULL return.

So I think this was already fixed by commit 13384f6125ad ("kasan: fix
null pointer dereference in kasan_record_aux_stack").

But see about that "decode_stacktrace,sh" script request. I thought I
had already asked for this, but I now realize that I think that was
just for syzbot.

Can we do that for these kernel test robot reports too? Please?

             Linus
--===============7352493352587367219==--

