Content-Type: multipart/mixed; boundary="===============6550756038308698323=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm/sl[au]b] 3c4cafa313: canonical_address#:#[##]
Date: Fri, 09 Sep 2022 15:44:19 +0200
Message-ID: <3d178109-5981-f4ee-8fe5-4f1d0c557ed2@suse.cz>
In-Reply-To: <Yxsd625lvTS6IWc+@hyeyoo>
List-Id: <oe-lkp.lists.linux.dev>

--===============6550756038308698323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/9/22 13:05, Hyeonggon Yoo wrote:
>> ----8<----
>> From d6f9fbb33b908eb8162cc1f6ce7f7c970d0f285f Mon Sep 17 00:00:00 2001
>> From: Vlastimil Babka <vbabka@suse.cz>
>> Date: Fri, 9 Sep 2022 12:03:10 +0200
>> Subject: [PATCH 2/3] mm/migrate: make isolate_movable_page() skip slab p=
ages
>> =

>> In the next commit we want to rearrange struct slab fields to allow a
>> larger rcu_head. Afterwards, the page->mapping field will overlap
>> with SLUB's "struct list_head slab_list", where the value of prev
>> pointer can become LIST_POISON2, which is 0x122 + POISON_POINTER_DELTA.
>> Unfortunately the bit 1 being set can confuse PageMovable() to be a
>> false positive and cause a GPF as reported by lkp [1].
>> =

>> To fix this, make isolate_movable_page() skip pages with the PageSlab
>> flag set. This is a bit tricky as we need to add memory barriers to SLAB
>> and SLUB's page allocation and freeing, and their counterparts to
>> isolate_movable_page().
> =

> Hello, I just took a quick grasp,
> Is this approach okay with folio_test_anon()?

Not if used on a completely random page as compaction scanners can, but
relies on those being first tested for PageLRU or coming from a page table
lookup etc.
Not ideal huh. Well I could improve also by switching 'next' and 'slabs'
field and relying on the fact that the value of LIST_POISON2 doesn't include
0x1, just 0x2.

--===============6550756038308698323==--

