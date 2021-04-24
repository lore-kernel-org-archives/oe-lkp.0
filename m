Content-Type: multipart/mixed; boundary="===============9066303581014320156=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Fri, 23 Apr 2021 20:30:38 -0700
Message-ID: <20210424033038.GP1401198@tassilo.jf.intel.com>
In-Reply-To: <CAOUHufZY62nDZiPvFH_SuMLN-4Nxhr0HeOo06RWdTcE9QbhhXg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9066303581014320156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Now the question is how we build the bloom filter. A simple answer is
> to let the rmap do the legwork, i.e., when it encounters dense
> regions, add them to the filter. Of course this means we'll have to
> use the rmap more than we do now, which is not ideal for some
> workloads but necessary to avoid worst case scenarios.

How would you maintain the bloom filter over time? Assume a process
that always creates new mappings and unmaps old mappings. How =

do the stale old mappings get removed and avoid polluting it over time?

Or are you thinking of one of the fancier bloom filter variants
that support deletion? As I understand they're significantly less
space efficient and more complicated.

-Andi
--===============9066303581014320156==--

