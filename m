Content-Type: multipart/mixed; boundary="===============7599652289230996935=="
MIME-Version: 1.0
From: Konstantin Kharlamov <hi-angel@yandex.ru>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Fri, 30 Apr 2021 09:37:58 +0300
Message-ID: <8ce5be3df2137e975d7333024b6120b71b214617.camel@yandex.ru>
In-Reply-To: <140226722f2032c86301fbd326d91baefe3d7d23.camel@yandex.ru>
List-Id: <oe-lkp.lists.linux.dev>

--===============7599652289230996935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Btw, I noticed a fun thing, an improvement. I don't know yet if it can be
attributed to 5.12 (which I didn't try alone yet) or to the LRU patchset, b=
ut
I'd assume the latter, because 5.12 seems didn't to have had anything
interesting regarding memory performance=C2=B9.

I usually have Skype running in background for work purposes, which is only=
 used
2-3 times in a week. So one would expect it to be one the first victims to
memory reclaim. Unfortunately, I never seen this to actually happen (till n=
ow,
that is): all skypeforlinux processes routinely have 0 bytes in SWAP, and t=
he
only circumstances under which its processes can get into SWAP is after
experiencing many SWAP-storms. It was so hard for the kernel to move these
unused processes to SWAP that at some point I even tried to research if the=
re
are any odd flags a userspace may have set on a process to keep it in RAM, =
just
in case that's what happens to Skype (A: no, that wasn't the case, running =
Skype
in a memory limited cgroup makes it swap. It's just that kernel decision we=
re
lacking for some reason).

So, anyway, I am delighted to see now that while testing this patchset, and
without encountering even a single SWAP-storm yet, skypeforlinux are one of=
 the
processes residing in SWAP!!

     =CE=BB smem -kc "name user pid pss swap" | grep skype    =

    skypeforlinux            constantine  1151    60.0K     7.5M =

    skypeforlinux            constantine  1215   195.0K     8.1M =

    skypeforlinux            constantine  1149   706.0K     7.5M =

    skypeforlinux            constantine  1148   743.0K     7.3M =

    skypeforlinux            constantine  1307     1.4M     8.0M =

    skypeforlinux            constantine  1213     2.1M    46.1M =

    skypeforlinux            constantine  1206    14.0M    10.8M =

    skypeforlinux            constantine   818    38.5M    34.3M =

    skypeforlinux            constantine  1242   103.2M    46.8M =


!!!

1: https://kernelnewbies.org/Linux_5.12#Memory_management

On Fri, 2021-04-30 at 02:46 +0300, Konstantin Kharlamov wrote:
> In case you need it yet, this series is:
> =

> Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
> =

> My success story: I have Archlinux with 8G RAM + zswap + swap. While deve=
loping,
> I have lots of apps opened such as multiple LSP-servers for different lan=
gs,
> chats, two browsers, etc=E2=80=A6 Usually, my system gets quickly to a po=
int of SWAP-
> storms, where I have to kill LSP-servers, restart browsers to free memory=
, etc,
> otherwise the system lags heavily and is barely usable.
> =

> 1.5 day ago I migrated from 5.11.15 kernel to 5.12 + the LRU patchset, an=
d I
> started up by opening lots of apps to create memory pressure, and worked =
for a
> day like this. Till now I had *not a single SWAP-storm*, and mind you I g=
ot 3.4G
> in SWAP. I was never getting to the point of 3G in SWAP before without a =
single
> SWAP-storm.
> =

> Right now my gf on Fedora 33 also suffers from SWAP-storms on her old Mac=
book
> 2013 with 4G RAM + zswap + swap, I think the next week I'll build for her=
 5.12 +
> LRU patchset as well. Will see how it goes, I expect it will improve her
> experience by a lot too.
> =

> P.S.: upon replying please keep me CCed, I'm not subscribed to the list

--===============7599652289230996935==--

