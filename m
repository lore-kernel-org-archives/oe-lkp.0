Content-Type: multipart/mixed; boundary="===============7231008011097444569=="
MIME-Version: 1.0
From: Quentin Perret <qperret@google.com>
To: lkp@lists.01.org
Subject: Re: [sched] 10e7071b2f: BUG:kernel_NULL_pointer_dereference, address
Date: Thu, 07 Nov 2019 12:15:51 +0000
Message-ID: <20191107121551.GB82729@google.com>
In-Reply-To: <20191107120922.GA82729@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7231008011097444569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thursday 07 Nov 2019 at 12:09:22 (+0000), Quentin Perret wrote:
> sched_move_task() follows what Peter called the 'change' pattern, so I'm
> thinking this is most likely the same issue. Dropping the lock causes an
> unmitigated race between sched_move_task() and pick_next_task_dl(), so
> hilarity ensues (set_next_task() being called twice for instance).

Bah, scratch that. 10e7071b2 is clearly before the pick_next_task()
rework, so that's not it :(

Quentin
--===============7231008011097444569==--

