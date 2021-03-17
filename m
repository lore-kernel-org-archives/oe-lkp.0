Content-Type: multipart/mixed; boundary="===============7175536934082008529=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [KEYS] 4a00e5e212: WARNING:at_arch/x86/kernel/static_call.c:#__static_call_validate
Date: Wed, 17 Mar 2021 09:41:22 +0100
Message-ID: <YFHAsgNhe8c3ZHQN@hirez.programming.kicks-ass.net>
In-Reply-To: <CAFA6WYMb-C2L7DmGnhWgxjuuvP=qxPA4-s4q+knxH+iWXypHmw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7175536934082008529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 12:55:02PM +0530, Sumit Garg wrote:
> > [    0.000000] ------------[ cut here ]------------
> > [    0.000000] unexpected static_call insn opcode 0xe9 at cleanup_trust=
ed+0x0/0x5
> =

> Here 0xe9 belongs to JMP32_INSN_OPCODE but I am not sure why it's
> considered incorrect given following snippet and corresponding
> objdump:
> =

> Snippet:
> =

> static void __exit cleanup_trusted(void)
> {
>         static_call_cond(trusted_key_exit)();
> }
> =

> module_exit(cleanup_trusted);
> =

> Objdump:
> =

> ffffffff832d91fc <cleanup_trusted>:
> ffffffff832d91fc:       e9 ef 83 b2 fe          jmpq
> ffffffff81e015f0 <__SCT__trusted_key_exit>
> =

> Maintainers,
> =

> Do you have any clue here?

It's an __exit function.. and we have:

	/*
	 * .exit.text is discarded at runtime, not link time, to deal with
	 *  references from .altinstructions
	 */
	.exit.text : AT(ADDR(.exit.text) - LOAD_OFFSET) {
		EXIT_TEXT
	}

So could it be the text is no longer actually there?

We have special handling for __init, but I don't think we have anything
for __exit.
--===============7175536934082008529==--

