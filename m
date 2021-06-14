Content-Type: multipart/mixed; boundary="===============6828635090761894104=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/mremap] ecf8443e51: vm-scalability.throughput -29.4% regression
Date: Mon, 14 Jun 2021 07:58:07 -0700
Message-ID: <CAHk-=wg+TcJtrwEUzoht2j0R3+jw=OCqckptdf4Q9vNgCPSpXA@mail.gmail.com>
In-Reply-To: <20210614145536.GB28801@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6828635090761894104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 7:39 AM kernel test robot <oliver.sang@intel.com>=
 wrote:
>

> FYI, we noticed a -29.4% regression of vm-scalability.throughput due to c=
ommit:
> ecf8443e51a8 ("[PATCH v7 02/11] mm/mremap: Fix race between MOVE_PUD mrem=
ap and pageout")

Ouch.

I guess it's not a huge surprise, but that's a fairly large regression.

Probably because the pud lock is just one single lock ("No scalability
reason to split PUD locks yet").

What happens if pud_lockptr() were to do the same thing that pmd_lockptr() =
does?

                Linus
--===============6828635090761894104==--

