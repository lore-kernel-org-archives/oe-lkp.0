Content-Type: multipart/mixed; boundary="===============5186531086012984689=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Thu, 26 Oct 2017 21:29:19 +0200
Message-ID: <CA+55aFw_7PFDnTRO1C6gH99vdY+w77Rp_8Ns8krSjxmxSs6mVw@mail.gmail.com>
In-Reply-To: <20171026190229.zt743ooxvjsukmis@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5186531086012984689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2017 at 9:02 PM, Ingo Molnar <mingo@kernel.org> wrote:
>
> Well, 'mem=3D2048M' shouldn't really limit device memory, it's supposed t=
o limit
> (trim) 'RAM' and not much else.

Agreed. You should very much be able to map in IO memory or whatever
above the 2G address even if the high_memory itself might be limited
to 2GB.

So I think that commit ce56a86e2ade ("x86/mm: Limit mmap() of /dev/mem
to valid physical addresses") is wrong, in that "high_memory" is very
much the wrong thing to test.

The memory mapping limit might validly be something like

   1ull << boot_cpu_data.x86_phys_bits

or similar, but for now I suspect that the right thing to do is to
revert. I'm not convinced that our "x86_phys_bits" value is guaranteed
to be always right, since I think we mainlyjust use it for showing
things, rather than have lots of code that depends on it.

Ingo?

               Linus

--===============5186531086012984689==--

