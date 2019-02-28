Content-Type: multipart/mixed; boundary="===============8624308615952853044=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [page cache] eb797a8ee0: vm-scalability.throughput -16.5% regression
Date: Thu, 28 Feb 2019 09:18:57 +0800
Message-ID: <87imx4pv5q.fsf@yhuang-dev.intel.com>
In-Reply-To: <1c33a91c-a436-a879-ca14-7eebcbf971c2@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8624308615952853044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Waiman Long <longman@redhat.com> writes:

> On 02/26/2019 12:30 PM, Linus Torvalds wrote:
>> On Tue, Feb 26, 2019 at 12:17 AM Huang, Ying <ying.huang@intel.com> wr=
ote:
>>> As for fixing.  Should we care about the cache line alignment of struct
>>> inode?  Or its size is considered more important because there may be a
>>> huge number of struct inode in the system?
>> Thanks for the great analysis.
>>
>> I suspect we _would_ like to make sure inodes are as small as
>> possible, since they are everywhere. Also, they are usually embedded
>> in other structures (ie "struct inode" is embedded into "struct
>> ext4_inode_info"), and unless we force alignment (and thus possibly
>> lots of padding), the actual alignment of 'struct inode' will vary
>> depending on filesystem.
>>
>> So I would suggest we *not* do cacheline alignment, because it will
>> result in random padding.
>>
>> But it sounds like maybe the solution is to make sure that the
>> different fields of the inode can and should be packed differently?
>>
>> So one thing to look at is to see what fields in 'struct inode' might
>> be best moved together, to minimize cache accesses.
>>
>> And in particular, if this is *only* an issue of "struct
>> rw_semaphore", maybe we should look at the layout of *that*. In
>> particular, I'm getting the feeling that we should put the "owner"
>> field right next to the "count" field, because the normal
>> non-contended path only touches those two fields.
>
> That is true. Putting the two next to each other reduces the chance of
> needing to touch 2 cachelines to acquire a rwsem.
>
>> Right now those two fields are pretty far from each other in 'struct
>> rw_semaphore', which then makes the "oops they got allocated in
>> different cachelines" much more likely.
>>
>> So even if 'struct inode' layout itself isn't changed, maybe just
>> optimizing the layout of 'struct rw_semaphore' a bit for the common
>> case might fix it all up.
>>
>> Waiman, I didn't check if your rewrite already possibly fixes this?
>
> My current patch doesn't move the owner field, but I will add one to do
> it. That change alone probably won't solve the regression we see here.
> The optimistic spinner is spinning on the on_cpu flag of the task
> structure as well as the rwsem->owner value (looking for change). The
> lock holder only need to touch the count/owner values once at unlock.
> However, if other hot data variables are in the same cacheline as
> rwsem->owner, we will have cacaheline bouncing problem. So we need to
> pad some rarely touched variables right before the rwsem in order to
> reduce the chance of false cacheline sharing.

Yes. And if my understanding were correct, if the rwsem is locked, the
new rw_sem users (which calls down_write()) will write rwsem->count and
some other fields of rwsem.  This will cause cache ping-pong between
lock holder and the new users too if the memory accessed by lock holder
shares the same cache line with rwsem->count, thus hurt the system
performance.  For the regression reported, the rwsem holder will change
address_space->i_mmap, if I put i_mmap and rwsem->count in the same
cache line and rwsem->owner in a different cache line, the performance
can improve ~8.3%.  While if I put i_mmap in one cache line and all
fields of rwsem in another different cache line, the performance can
improve ~12.9% (in another machine, where the regression is ~14%).

So I think in the heavily contended situation, we should put the fields
accessed by rwsem holder in a different cache line of rwsem.  But in
un-contended situation, we should put the fields accessed in rwsem
holder and rwsem in the same cache line to reduce the cache footprint.
The requirement of un-contended and heavily contended situation is
contradicted.

Best Regards,
Huang, Ying

> -Longman

--===============8624308615952853044==--

