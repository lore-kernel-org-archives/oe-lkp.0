Content-Type: multipart/mixed; boundary="===============5008228682787691210=="
MIME-Version: 1.0
From: Valentin Schneider <valentin.schneider@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched] 10e7071b2f: BUG:kernel_NULL_pointer_dereference, address
Date: Thu, 07 Nov 2019 12:37:09 +0000
Message-ID: <6a23a062-9b82-668d-7945-8da34f4dc5f0@arm.com>
In-Reply-To: <20191107121551.GB82729@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5008228682787691210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/11/2019 12:15, Quentin Perret wrote:
> On Thursday 07 Nov 2019 at 12:09:22 (+0000), Quentin Perret wrote:
>> sched_move_task() follows what Peter called the 'change' pattern, so I'm
>> thinking this is most likely the same issue. Dropping the lock causes an
>> unmitigated race between sched_move_task() and pick_next_task_dl(), so
>> hilarity ensues (set_next_task() being called twice for instance).
> =

> Bah, scratch that. 10e7071b2 is clearly before the pick_next_task()
> rework, so that's not it :(
> =


And besides we don't drop the lock until reaching pick_next_task_fair(),
and the splat says it died on pick_next_task_dl() which happens earlier.

> Quentin
>=20
--===============5008228682787691210==--

