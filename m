Content-Type: multipart/mixed; boundary="===============2777361346034367658=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: MADV_HUGEPAGE vs. NUMA semantic (was: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression)
Date: Fri, 07 Dec 2018 10:06:18 +0100
Message-ID: <779efc07-cac0-5d36-72fc-11d99060cac7@suse.cz>
In-Reply-To: <20181207074954.GR1286@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2777361346034367658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/7/18 8:49 AM, Michal Hocko wrote:
>> But *that* in turn makes for other possible questions:
>>
>>  - if the reason we couldn't get a local hugepage is that we're simply
>> out of local memory (huge *or* small), then maybe a remote hugepage is
>> better.
>>
>>    Note that this now implies that the choice can be an issue of "did
>> the hugepage allocation fail due to fragmentation, or due to the node
>> being low of memory"
> How exactly do you tell? Many systems are simply low on memory due to
> caching. A clean pagecache is quite cheap to reclaim but it can be more
> expensive to fault in. Do we consider it to be a viable target?

Compaction can report if it failed (more precisely: was skipped) due to
low memory, or for other reasons. It doesn't distinguish how easily
reclaimable is the memory, but I don't think we should reclaim anything
(see below).

>> and there is the other question that I asked in the other thread
>> (before subject edit):
>>
>>  - how local is the load to begin with?
>>
>>    Relatively shortlived processes - or processes that are explicitly
>> bound to a node - might have different preferences than some
>> long-lived process where the CPU bounces around, and might have
>> different trade-offs for the local vs remote question too.
> Agreed
> =

>> So just based on David's numbers, and some wild handwaving on my part,
>> a slightly more complex, but still very sensible default might be
>> something like
>>
>>  1) try to do a cheap local node hugepage allocation
>>
>>     Rationale: everybody agrees this is the best case.
>>
>>     But if that fails:
>>
>>  2) look at compacting and the local node, but not very hard.
>>
>>     If there's lots of memory on the local node, but synchronous
>> compaction doesn't do anything easily, just fall back to small pages.
> Do we reclaim at this stage or this is mostly GFP_NOWAIT attempt?

I would expect no reclaim, because for non-THP faults we also don't
reclaim the local node before trying to allocate from remote node. If
somebody wants such behavior they can enable the node reclaim mode. THP
faults shouldn't be different in this regard, right?


--===============2777361346034367658==--

