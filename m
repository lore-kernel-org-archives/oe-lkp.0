Content-Type: multipart/mixed; boundary="===============7437487916685371616=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] d0164adc89: -100.0% fsmark.app_overhead
Date: Mon, 07 Dec 2015 17:18:21 +0100
Message-ID: <20151207161820.GB20774@dhcp22.suse.cz>
In-Reply-To: <87wpsvkmhs.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7437487916685371616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 04-12-15 09:53:35, Huang, Ying wrote:
> Mel Gorman <mgorman@techsingularity.net> writes:
[...]
> > What is the result of the __GFP_HIGH patch to give it access to
> > reserves?
> =

> Applied Michal's patch on v4.4-rc3 and tested again, now there is no
> page allocation failure.

I still think this is just a coincidence and __GFP_HIGH just
papers over it (it still makes sense for other reasons though). It
would be better imho to log all allocations which do not include
___GFP_KSWAPD_RECLAIM. This might help us to pin point a caller which
was previously waking kswapd up but it doesn't do so anymore.  There
would have to be a very specific pattern to trigger this because most
allocations would simply wake kswapd up. I am just wondering that
any debugging would simply alter the timing and/or allocation pattern
and we would see a different results so I am not sure this is worth
spending a lot of time on.

-- =

Michal Hocko
SUSE Labs

--===============7437487916685371616==--

