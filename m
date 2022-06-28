Content-Type: multipart/mixed; boundary="===============4009227440589755733=="
MIME-Version: 1.0
From: Roman Gushchin <roman.gushchin@linux.dev>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Mon, 27 Jun 2022 18:46:44 -0700
Message-ID: <YrpdhDx3DDXtxx7b@castle>
In-Reply-To: <CALvZod60OHC4iQnyBd16evCHXa_8ucpHiRnm9iNErQeUOycGZw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4009227440589755733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 09:48:01AM -0700, Shakeel Butt wrote:
> On Mon, Jun 27, 2022 at 9:26 AM Eric Dumazet <edumazet@google.com> wrot=
e:
> >
> [...]
> > >
> >
> > I simply did the following and got much better results.
> >
> > But I am not sure if updates to ->usage are really needed that often...
> =

> I suspect we need to improve the per-cpu memcg stock usage here. Were
> the updates mostly from uncharge path or charge path or that's
> irrelevant?
> =

> I think doing full drain (i.e. drain_stock()) within __refill_stock()
> when the local cache is larger than MEMCG_CHARGE_BATCH is not best.
> Rather we should always keep at least MEMCG_CHARGE_BATCH for such
> scenarios.

+1, really good point.
--===============4009227440589755733==--

