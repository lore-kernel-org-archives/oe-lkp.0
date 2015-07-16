Content-Type: multipart/mixed; boundary="===============3740832349889667076=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [mminit] [ INFO: possible recursive locking detected ]
Date: Thu, 16 Jul 2015 18:51:39 +0100
Message-ID: <20150716175139.GB2561@suse.de>
In-Reply-To: <CALYGNiMUXMvvvi-+64Nd6Qb8Db2EiGZ26jbP8yotUHWS4uF1jg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3740832349889667076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 08:13:38PM +0300, Konstantin Khlebnikov wrote:
> > @@ -1187,14 +1195,14 @@ void __init page_alloc_init_late(void)
> >  {pgdat_init_rwsempgdat_init_rwsempgdat_init_rwsem
> >         int nid;
> >
> > +       /* There will be num_node_state(N_MEMORY) threads */
> > +       atomic_set(&pgdat_init_n_undone, num_node_state(N_MEMORY));
> >         for_each_node_state(nid, N_MEMORY) {
> > -               down_read(&pgdat_init_rwsem);
> =

> Rw-sem have special "non-owner" mode for keeping lockdep away.
> This should be enough:
> =


I think in this case that the completions look nicer though so I think
I'll keep them.

-- =

Mel Gorman
SUSE Labs

--===============3740832349889667076==--

