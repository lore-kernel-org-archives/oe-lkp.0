Content-Type: multipart/mixed; boundary="===============4654041642099612612=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] 9bc8039e71: will-it-scale.per_thread_ops -64.1% regression
Date: Mon, 05 Nov 2018 17:40:14 -0500
Message-ID: <60ef3584-6f3a-1a9a-94d1-3d4a5b9f1e56@redhat.com>
In-Reply-To: <CAHk-=wjZ1C2iL79jOuC9ysvX2oRpUjoqXirvY0NRuLC0eQ8nbg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4654041642099612612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/05/2018 05:14 PM, Linus Torvalds wrote:
> On Mon, Nov 5, 2018 at 12:12 PM Vlastimil Babka <vbabka@suse.cz> wrote:
>> I didn't spot an obvious mistake in the patch itself, so it looks
>> like some bad interaction between scheduler and the mmap downgrade?
> I'm thinking it's RWSEM_SPIN_ON_OWNER that ends up being confused by
> the downgrade.
>
> It looks like the benchmark used to be basically CPU-bound, at about
> 800% CPU, and now it's somewhere in the 200% CPU region:
>
>                   will-it-scale.time.percent_of_cpu_this_job_got
>
>   800 +-+----------------------------------------------------------------=
---+
>       |.+.+.+.+.+.+.+.  .+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+..+.+.+.+. .+.+=
.+.|
>   700 +-+             +.                                            +    =
   |
>       |                                                                  =
   |
>   600 +-+                                                                =
   |
>       |                                                                  =
   |
>   500 +-+                                                                =
   |
>       |                                                                  =
   |
>   400 +-+                                                                =
   |
>       |                                                                  =
   |
>   300 +-+                                                                =
   |
>       |                                                                  =
   |
>   200 O-O O O O O                O                                       =
   |
>       |           O O O  O O O O   O O O O O O O O O O O                 =
   |
>   100 +-+----------------------------------------------------------------=
---+
>
> which sounds like the downgrade really messes with the "spin waiting
> for lock" logic.
>
> I'm thinking it's the "wake up waiter" logic that has some bad
> interaction with spinning, and breaks that whole optimization.
>
> Adding Waiman and Davidlohr to the participants, because they seem to
> be the obvious experts in this area.
>
>                             Linus

Optimistic spinning on rwsem is done only on writers spinning on a
writer-owned rwsem. If a write-lock is downgraded to a read-lock, all
the spinning waiters will quit. That may explain the drop in cpu
utilization. I do have a old patch that enable a certain amount of
reader spinning which may help the situation. I can rebase that and send
it out for review if people have interest.

Cheers,
Longman



--===============4654041642099612612==--

