Content-Type: multipart/mixed; boundary="===============3716820244811188742=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Fri, 23 Apr 2021 22:16:12 -0600
Message-ID: <CAOUHufb44NbJOM0UkvBE=D7z-zm8Mkdk094QHW-msEZsBS2FFw@mail.gmail.com>
In-Reply-To: <20210424033038.GP1401198@tassilo.jf.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3716820244811188742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 9:30 PM Andi Kleen <ak@linux.intel.com> wrote:
>
> > Now the question is how we build the bloom filter. A simple answer is
> > to let the rmap do the legwork, i.e., when it encounters dense
> > regions, add them to the filter. Of course this means we'll have to
> > use the rmap more than we do now, which is not ideal for some
> > workloads but necessary to avoid worst case scenarios.
>
> How would you maintain the bloom filter over time? Assume a process
> that always creates new mappings and unmaps old mappings. How
> do the stale old mappings get removed and avoid polluting it over time?
>
> Or are you thinking of one of the fancier bloom filter variants
> that support deletion? As I understand they're significantly less
> space efficient and more complicated.

Hi Andi,

That's where the double buffering technique comes in :)

Recap: the creation of each new generation starts with scanning page
tables to clear the accessed bit of pages referenced since the last
scan.

We scan page tables according to the current bloom filter, and at the
same time, we build a new one and write it to the second buffer.
During this step, we eliminate regions that have become invalid, e.g.,
too sparse or completely unmapped. Note that the scan *will* miss
newly mapped regions, i.e., dense regions that the rmap hasn't
discovered. Once this step is done, we flip to the second buffer. And
from now on, all the new dense regions discovered by the rmap will be
recorded into this buffer.

Each element in the bloom filter is a hash value from an address of a
page table and a node id, indicating this page table has a worth
number of pages from this node.

A single counting bloom filter works too but it doesn't seem to offer
any advantage over double buffering. And we need to handle overflow
too.
--===============3716820244811188742==--

