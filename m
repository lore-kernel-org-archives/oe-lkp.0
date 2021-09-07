Content-Type: multipart/mixed; boundary="===============4827629429331480943=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 11:18:21 -0600
Message-ID: <22a0156e-f74f-51c8-b7fd-9b5a375d7c81@kernel.dk>
In-Reply-To: <YTeeBf64yUwj01Sf@slm.duckdns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4827629429331480943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/7/21 11:14 AM, Tejun Heo wrote:
> Hello,
> =

> On Tue, Sep 07, 2021 at 10:11:21AM -0700, Roman Gushchin wrote:
>> There are two polar cases:
>> 1) a big number of relatively short-living allocations, which lifetime i=
s well
>>    bounded (e.g. by a lifetime of a task),
>> 2) a relatively small number of long-living allocations, which lifetime
>>    is potentially indefinite (e.g. struct mount).
>>
>> We can't use the same approach for both cases, otherwise we'll run into =
either
>> performance or garbage collection problems (which also lead to performan=
ce
>> problems, but delayed).
> =

> Wouldn't a front cache which expires after some seconds catch both cases?

A purely time based approach might be problematic, as you can allocate a
LOT of data in a short amount of time. Heuristics probably need to be a
hybrid of "time much time has passed" OR "we're over the front cache
threshold in terms of deferred accounting". But yes, I don't see why
we'd necessarily need different approaches for short vs long life times.

-- =

Jens Axboe

--===============4827629429331480943==--

