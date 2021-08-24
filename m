Content-Type: multipart/mixed; boundary="===============5323703384414798851=="
MIME-Version: 1.0
From: Colin Ian King <colin.king@canonical.com>
To: lkp@lists.01.org
Subject: Re: [pipe] 3b844826b6: stress-ng.sigio.ops_per_sec -99.3% regression
Date: Tue, 24 Aug 2021 19:42:05 +0100
Message-ID: <066f6c17-95a9-ba37-83d5-f0ee0d98bac8@canonical.com>
In-Reply-To: <CAHk-=wiKAg5QtrQOtvKNwkRUn0b2xufO54GPhUoTWxBgDzXWNA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5323703384414798851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 24/08/2021 18:32, Linus Torvalds wrote:
> [ Added Colin King, as this looks to be related to stress-sigio.c ]
> =

> On Tue, Aug 24, 2021 at 9:22 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Tue, Aug 24, 2021 at 7:56 AM kernel test robot <oliver.sang@intel.c=
om> wrote:
>>>
>>> FYI, we noticed a -99.3% regression of stress-ng.sigio.ops_per_sec due =
to commit:
>>
>> Well, that's bad.
>>
>>> commit: 3b844826b6c6 ("pipe: avoid unnecessary EPOLLET wakeups under no=
rmal loads")
>>
>> You fix one benchmark, you break another..
>>
>> What's a bit odd is that this commit basically reverts commit
>> 3a34b13a88ca ("pipe: make pipe writes always wake up readers") which
>> did *not* result in any kernel test robot report.
> =

> Hmm. I have a possible clue.
> =

> I suspect this may be timing-related, and I wonder if the kernel test
> robot just didn't happen to notice - or report - the other edge of
> this performance regression because it ends up being random enough.
> =

> In particular, I think stress-sigio.c is subtly buggy, and the "send
> SIGIO on every write" may have effectively hidden the bug.
> =

> Here's my theory on what's going on, and why it has tghat odd -99.3% regr=
ession:
> =

>  - the child in stress-sigio.c does multiple writes in quick
> succession, while the parent is scheduled away
> =

>  - the pipe was empty at the beginning, but we send just *one* SIGIO
> for all these writes
> =

>  - the parent gets the SIGIO, and goes to stress_sigio_handler(), and
> reads the buffer
> =

> but the parent doesn't necessarily *empty* the buffer, so it won't get
> any more SIGIO signals from subsequent writes.
> =

> The reason this is timing-dependent and about luck is because the
> *read* size is BUFFER_SIZE (4kB), but the write sizes are BUFFER_SIZE
>>> 4 (256 bytes), so 99% of the time if the parent is at all timely,
> it will do that big read and empty the buffer.
> =

> But if the child ends up able to do more than 16 writes in a row
> before the parent wakes up and reads data, the buffer will have more
> than 4kB of data in it, and when the parent SIGIO handler happens it
> won't empty the data, and so it will never see another SIGIO.
> =

> And again - I think this all happened before too (ie before commit
> 3a34b13a88ca) and so 3b844826b6c6 ("pipe: avoid unnecessary EPOLLET
> wakeups under normal loads") isn't a _new_ regression, it just exposed
> the bug in the test-case again, and this time the kernel test robot
> caught it.
> =

> In other words, I think this is very similar to the EPOLLET problem:
> user space expected (perhaps not _intentionally_) that SIGIO would
> happen over and over again when you add new data, even if the pipe
> already had data.

yep, that's basically the underlying assumption I made with this rather
naive test. I'll re-work it sometime this week once I can formally
verify this is what is happening.

Thanks Linus for the insight.

Colin

> =

> So then commit 1b6b26ae7053 ("pipe: fix and clarify pipe write wakeup
> logic") came around back in 2019, and only sent SIGIO when the pipe
> buffer status _changed_ (ie went from empty to having data, rather
> than "there's new data") and at that point stress-sigio.c became very
> fragile.
> =

> We could do the same ugly thing for FASYNC that we do for EPOLLET -
> make it always fasync on new data, exactly because the previous SIGIO
> might not have emptied the buffer completely.
> =

> I'm a _bit_ surprised that the kernel test robot didn't catch this
> back in 2019, and also didn't report this when commit 3a34b13a88ca
> ("pipe: make pipe writes always wake up readers") should have sped
> things up again, but I guess the "it's very timing-dependent" might
> explain it.
> =

> Colin, comments?
> =

> Anyway, the above blathering is not based on any actual real data. I'm
> just looking at stress-sigio.c to see what could be going wrong, and
> what would explain the test robot report. It's the only thing I see,
> but maybe somebody else sees anything else..
> =

>                       Linus
>=20

--===============5323703384414798851==--

