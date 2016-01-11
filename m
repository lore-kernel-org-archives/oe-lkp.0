Content-Type: multipart/mixed; boundary="===============1144575018632070130=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] printk: clear console_may_schedule on panic flushing
Date: Mon, 11 Jan 2016 17:25:02 -0500
Message-ID: <20160111222502.GM1898@mtj.duckdns.org>
In-Reply-To: <20160111220927.GL1898@mtj.duckdns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1144575018632070130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello, again.

On Mon, Jan 11, 2016 at 05:09:27PM -0500, Tejun Heo wrote:
> > You didn't comment on Sergey's observations
> > (https://lkml.org/lkml/2015/12/2/1192), but I'm believing this is
> > a separate issue and that this patch is still good.
> =

> Missed that one somehow.  Will respond.

So, I agree with Jan's response there.  My patch wasn't a full
solution to the whole problem.  It solves a specific case (hang during
registration of a slow console device) and is also needed for future
improvements but we still need Jan's patchset and more to actually get
the problem solved.

Thanks.

-- =

tejun

--===============1144575018632070130==--

