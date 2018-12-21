Content-Type: multipart/mixed; boundary="===============7081708477012070924=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Fri, 21 Dec 2018 14:15:05 -0800
Message-ID: <alpine.DEB.2.21.1812211413460.219499@chino.kir.corp.google.com>
In-Reply-To: <20181214231147.GF29005@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7081708477012070924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 14 Dec 2018, Mel Gorman wrote:

> > In other words, I think there is a lot of potential stranding that occu=
rs =

> > for both scanners that could otherwise result in completely free =

> > pageblocks.  If there a single movable page present near the end of the =

> > zone in an otherwise fully free pageblock, surely we can do better than =

> > the current implementation that would never consider this very easy to =

> > compact memory.
> > =

> =

> While it's somewhat premature, I posted a series before I had a full set
> of results because it uses free lists to reduce searches and reduces
> inference between multiple scanners. Preliminary results indicated it
> boosted allocation success rates by 20%ish, reduced migration scanning
> by 99% and free scanning by 27%.
> =


Always good to have code to look at, I'll take a closer look.  I've =

unfortunately been distracted with other kernel issues lately :/

--===============7081708477012070924==--

