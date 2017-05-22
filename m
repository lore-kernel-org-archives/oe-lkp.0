Content-Type: multipart/mixed; boundary="===============2759779768763363233=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [waitid()] 75f64d68f9: Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=
Date: Sun, 21 May 2017 18:39:24 -0700
Message-ID: <CA+55aFwzB9C6U7pgRg9UTq+2m-F6WTVO9ghMjYtHYTpfZ78NEA@mail.gmail.com>
In-Reply-To: <CA+55aFyoDW8-VA2R7Ay6SJ9Vf7kJfuzEMBZ5JQfbTn-9Ab7Quw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2759779768763363233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 21, 2017 at 3:19 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Did an "allyesconfig" build on 32-bit x86, and looked at who uses the
> 8-byte get_user/put_user cases:

I've done more testing.

It turns out that quite independently of all these patches, our 32-bit
x86 code is entirely broken.

In particular, __get_user_asm_u64() has two independent bugs, one
fairly harmless, and one that can be entirely deadly.

The harmless one is that we have the ASM_STAC/ASM_CLAC markers around
the user access in there, even though they should have gotten removed.
That cone can be considered a "merge error" between commit

  b2f680380ddf ("x86/mm/32: Add support for 64-bit __get_user() on
32-bit kernels")

that added the 64-bit case, and commit

  11f1a4b9755f x86: reorganize SMAP handling in user space accesses

that moved the CLAC/STAC into the caller.

So it turns out that a 64-bit __get_user() case will have a double
pair of STAC/CLAC instructions, making it even slower than it should
otherwise be. But it all still *works* fine.

The much worse issue is that the asm is just buggered, and when it does

      "1: movl %2,%%eax\n" \
      "2: movl %3,%%edx\n" \

it can be that %eax is actually used for the address, so the second
move can do crazy bad things. It can (and does) generate code like
this:

 18c:   8b 00                   mov    (%eax),%eax
 18e:   8b 50 04                mov    0x4(%eax),%edx

(I'm not sure that actually happens anywhere in the kernel, but it did
happen in my test-case).

So the 64-bit output needs to be marked as being an early-clobber,
meaning that it can be written to early in the asm. So we need to use
"=3D&A", not "=3DA" for it.

Adding Ben LaHaise to the cc, since that "=3DA" bug goes back to the
original implementation of __get_user_asm_u64() (which is only a year
ago, but still).

I've committed a fix, and now the generated asm looks ok, but I don't
actually have any 32-bit x86 machines left. Hopefully somebody still
does and can test this..

                Linus

--===============2759779768763363233==--

