Content-Type: multipart/mixed; boundary="===============1503210834638573984=="
MIME-Version: 1.0
From: Craig Bergstrom <craigb@google.com>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Thu, 26 Oct 2017 13:50:40 -0600
Message-ID: <CAOJUGyfZxbhyMuh3zE77R3b30RF3Xi7jB4_mmSjhWtFQhVc5jQ@mail.gmail.com>
In-Reply-To: <CA+55aFw_7PFDnTRO1C6gH99vdY+w77Rp_8Ns8krSjxmxSs6mVw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1503210834638573984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Reverting seems like the right approach at the moment.  My apologies
for the breakage so late the in the cycle.

Post-revert, there remains a bug here wherein you can make the system
OOPS if you mmap memory above the 48 bit bus width.  Linus/Ingo, is
there something in particular that you'd like to see before pulling in
a check on the bus width (or some other fix)?  Based on Linus'
comment, the bus width check smells like something that should cook
for a while before pulling into mainline.

On Thu, Oct 26, 2017 at 1:29 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Oct 26, 2017 at 9:02 PM, Ingo Molnar <mingo@kernel.org> wrote:
>>
>> Well, 'mem=3D2048M' shouldn't really limit device memory, it's supposed =
to limit
>> (trim) 'RAM' and not much else.
>
> Agreed. You should very much be able to map in IO memory or whatever
> above the 2G address even if the high_memory itself might be limited
> to 2GB.
>
> So I think that commit ce56a86e2ade ("x86/mm: Limit mmap() of /dev/mem
> to valid physical addresses") is wrong, in that "high_memory" is very
> much the wrong thing to test.
>
> The memory mapping limit might validly be something like
>
>    1ull << boot_cpu_data.x86_phys_bits
>
> or similar, but for now I suspect that the right thing to do is to
> revert. I'm not convinced that our "x86_phys_bits" value is guaranteed
> to be always right, since I think we mainlyjust use it for showing
> things, rather than have lots of code that depends on it.
>
> Ingo?
>
>                Linus

--===============1503210834638573984==--

