Content-Type: multipart/mixed; boundary="===============1050749572055049442=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/kconfig] 81d3871900: BUG:unable_to_handle_kernel
Date: Thu, 12 Oct 2017 10:54:57 -0700
Message-ID: <CAADWXX-8NqkbGHXGxdEiiaqHnNt-EvYXJww_0dOdjhu+7fZGVg@mail.gmail.com>
In-Reply-To: <alpine.DEB.2.20.1710121202210.28556@nuc-kabylake>
List-Id: <oe-lkp.lists.linux.dev>

--===============1050749572055049442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 10:05 AM, Christopher Lameter <cl@linux.com> wrot=
e:
> On Wed, 11 Oct 2017, Josh Poimboeuf wrote:
>
>> I failed to add the slab maintainers to CC on the last attempt.  Trying
>> again.
>
> Hmmm... Yea. SLOB is rarely used and tested. Good illustration of a simple
> allocator and the K&R mechanism that was used in the early kernels.

Should we finally just get rid of SLOB?

I'm not happy about the whole "three different allocators" crap. It's
been there for much too long, and I've tried to cut it down before.
People always protest, but three different allocators, one of which
gets basically no testing, is not good.

               Linus

--===============1050749572055049442==--

