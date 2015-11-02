Content-Type: multipart/mixed; boundary="===============4375641296280634874=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] 43993977ba: +88% OOM possibility
Date: Mon, 02 Nov 2015 10:53:35 +0100
Message-ID: <20151102095334.GE630@dhcp22.suse.cz>
In-Reply-To: <87twp4232k.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4375641296280634874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 02-11-15 16:55:15, Huang, Ying wrote:
> Michal Hocko <mhocko@kernel.org> writes:
[...]
> > It would be interesting to see all the page allocation failure warnings
> > (if they are different). Maybe other callers have relied on GFP_ATOMIC
> > and access to memory reserves. The above path is not this case though.
> =

> I take a look at all dmesgs, and found the backtrace for page allocation
> failure is same for all.  Is it possible that this commit cause more
> memory were allocated or kept in memory so that more OOM were triggered?

I can imagine that some of the callers were not converted properly or
missed and a lack of __GFP_KSWAPD_RECLAIM could indeed cause a later
kswapd kick off. I am staring into the commit but nothing has jumped at
me yet. Could you collect /proc/vmstat (snapshot every 1s) on both good
and bad kernels. I expect the later would see a less scanning by kswapd.
-- =

Michal Hocko
SUSE Labs

--===============4375641296280634874==--

