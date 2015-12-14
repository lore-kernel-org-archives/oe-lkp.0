Content-Type: multipart/mixed; boundary="===============2362257672957400779=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: [mm] 3f5d849cb0: page dumped because: VM_BUG_ON_PAGE(!PageLocked(page))
Date: Tue, 15 Dec 2015 09:09:28 +1100
Message-ID: <20151215090928.0e489c3c@canb.auug.org.au>
In-Reply-To: <20151214152653.GB13289@cmpxchg.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2362257672957400779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 14 Dec 2015 10:26:53 -0500 Johannes Weiner <hannes@cmpxchg.org> w=
rote:
>
> I'm fairly certain this is this unlocked page issue:
> http://www.spinics.net/lists/kernel/msg2142719.html
> =

> The fix went into Linus's tree only yesterday:
> dfd01f0 ("sched/wait: Fix the signal handling fix")

And will be in linux-next today.

-- =

Cheers,
Stephen Rothwell                    sfr(a)canb.auug.org.au

--===============2362257672957400779==--

