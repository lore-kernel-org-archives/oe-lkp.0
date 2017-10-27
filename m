Content-Type: multipart/mixed; boundary="===============2005371169986888241=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Fri, 27 Oct 2017 10:25:36 +0200
Message-ID: <20171027082536.nddlpodniv6saylz@gmail.com>
In-Reply-To: <CA+55aFw_7PFDnTRO1C6gH99vdY+w77Rp_8Ns8krSjxmxSs6mVw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2005371169986888241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, Oct 26, 2017 at 9:02 PM, Ingo Molnar <mingo@kernel.org> wrote:
> >
> > Well, 'mem=3D2048M' shouldn't really limit device memory, it's supposed=
 to limit
> > (trim) 'RAM' and not much else.
> =

> Agreed. You should very much be able to map in IO memory or whatever
> above the 2G address even if the high_memory itself might be limited
> to 2GB.
> =

> So I think that commit ce56a86e2ade ("x86/mm: Limit mmap() of /dev/mem
> to valid physical addresses") is wrong, in that "high_memory" is very
> much the wrong thing to test.
> =

> The memory mapping limit might validly be something like
> =

>    1ull << boot_cpu_data.x86_phys_bits
> =

> or similar, but for now I suspect that the right thing to do is to
> revert. I'm not convinced that our "x86_phys_bits" value is guaranteed
> to be always right, since I think we mainlyjust use it for showing
> things, rather than have lots of code that depends on it.
> =

> Ingo?

Yeah, I think a more robust condition would be something like:

int valid_phys_addr_range(phys_addr_t addr, size_t count)
{
	return !((addr + count) >> MAX_PHYSMEM_BITS);
}

... as we already rely on MAX_PHYSMEM_BITS in a number of other critical pl=
aces.

(Totally untested though.)

Thanks,

	Ingo

--===============2005371169986888241==--

