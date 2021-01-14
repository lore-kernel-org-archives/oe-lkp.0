Content-Type: multipart/mixed; boundary="===============5613605428000492489=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: [mm] 10befea91b: hackbench.throughput -62.4% regression
Date: Wed, 13 Jan 2021 19:18:39 -0800
Message-ID: <20210114031839.GA415540@carbon.dhcp.thefacebook.com>
In-Reply-To: <20210114025151.GA22932@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5613605428000492489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 10:51:51AM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -62.4% regression of hackbench.throughput due to commit:

Hi!

Commit "mm: memcg/slab: optimize objcg stock draining" (currently only in t=
he mm tree,
so no stable hash) should improve the hackbench regression.

Thanks!
--===============5613605428000492489==--

