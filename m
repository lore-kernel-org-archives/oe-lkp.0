Content-Type: multipart/mixed; boundary="===============8405227354099876426=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 10:14:22 -0600
Message-ID: <27face50-0e55-ad2b-ebb7-2fe48aee8374@kernel.dk>
In-Reply-To: <CALvZod6S+NmG8+-ftS-w3t3zJg_kbr3-F9h-n4jwSnqh0jTUGQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8405227354099876426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/7/21 9:57 AM, Shakeel Butt wrote:
> On Tue, Sep 7, 2021 at 8:46 AM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 9/7/21 9:07 AM, kernel test robot wrote:
>>>
>>>
>>> Greeting,
>>>
>>> FYI, we noticed a -33.6% regression of will-it-scale.per_process_ops du=
e to commit:
>>>
>>>
>>> commit: 0f12156dff2862ac54235fc72703f18770769042 ("memcg: enable accoun=
ting for file lock caches")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> Are we at all worried about these? There's been a number of them
>> reported, basically for all the accounting enablements that have been
>> done in this merge window.
>>
>> When io_uring was switched to use accounted memory, we did a bunch of
>> work to ameliorate the inevitable slowdowns that happen if you do
>> repeated allocs and/or frees and have memcg accounting enabled.
>>
> =

> I think these are important and we should aim to continuously improve
> performance with memcg accounting. I would like to know more about the
> io_uring work done to improve memcg accounting. Maybe we can
> generalize it to others as well.

It's pretty basic and may not be applicable to all cases, we simply hang
on to our allocations for longer periods and reuse them. Hence instead
of always going through alloc+free to each "unit", they are recycled and
reused until no longer needed.

Now this is more efficient in general for us, as we can have a very high
rate of requests (and hence allocs+frees). I suspect most use cases
would benefit from simply having a cache in front of memcg slabs, but
that seems like solving the issue at the wrong layer. IMHO it'd be
better to have the memcg accounting be done in batches, eg have some
notion of deferred frees. If someone allocates before the deferred frees
are accounted, then that would have saved two pieces of accounting.

It is of course possible that a lot of these regressions are simply
accounting the alloc, in which case it seems like accounting in batches
might help there. All depends on the slack that is acceptable for memcg.

-- =

Jens Axboe

--===============8405227354099876426==--

