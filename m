Content-Type: multipart/mixed; boundary="===============8318537457253771338=="
MIME-Version: 1.0
From: Quentin Perret <qperret@google.com>
To: lkp@lists.01.org
Subject: Re: [sched] 10e7071b2f: BUG:kernel_NULL_pointer_dereference, address
Date: Thu, 07 Nov 2019 12:43:55 +0000
Message-ID: <20191107124355.GA161316@google.com>
In-Reply-To: <6a23a062-9b82-668d-7945-8da34f4dc5f0@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8318537457253771338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thursday 07 Nov 2019 at 12:37:09 (+0000), Valentin Schneider wrote:
> On 07/11/2019 12:15, Quentin Perret wrote:
> > On Thursday 07 Nov 2019 at 12:09:22 (+0000), Quentin Perret wrote:
> >> sched_move_task() follows what Peter called the 'change' pattern, so I=
'm
> >> thinking this is most likely the same issue. Dropping the lock causes =
an
> >> unmitigated race between sched_move_task() and pick_next_task_dl(), so
> >> hilarity ensues (set_next_task() being called twice for instance).
> > =

> > Bah, scratch that. 10e7071b2 is clearly before the pick_next_task()
> > rework, so that's not it :(
> > =

> =

> And besides we don't drop the lock until reaching pick_next_task_fair(),
> and the splat says it died on pick_next_task_dl() which happens earlier.

Right, with the rework of pick_next_task(), we would in fact drop the
lock before calling pick_next_task_dl(), which would explain the issue,
hence my confusion.

But that doesn't apply here, so this is another problem :(

Sorry for the noise,
Quentin
--===============8318537457253771338==--

