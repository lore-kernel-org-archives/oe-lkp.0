Content-Type: multipart/mixed; boundary="===============0846856617479615403=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Wed, 14 Apr 2021 20:00:02 -0700
Message-ID: <20210415030002.GX3762101@tassilo.jf.intel.com>
In-Reply-To: <CAOUHufZ4o4zmW_PyRCXWmBj4OVgVJdC6h1wZsJFMWpGxpzyGdg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0846856617479615403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> We fall back to the rmap when it's obviously not smart to do so. There
> is still a lot of room for improvement in this function though, i.e.,
> it should be per VMA and NUMA aware.

Okay so it's more a question to tune the cross over heuristic. That
sounds much easier than replacing everything.

Of course long term it might be a problem to maintain too many =

different ways to do things, but I suppose short term it's a reasonable
strategy.

-Andi

--===============0846856617479615403==--

