Content-Type: multipart/mixed; boundary="===============2917410513939846764=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] printk: clear console_may_schedule on panic flushing
Date: Mon, 11 Jan 2016 17:09:27 -0500
Message-ID: <20160111220927.GL1898@mtj.duckdns.org>
In-Reply-To: <20160111135951.b5f81c02c6d2054164f618af@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2917410513939846764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jan 11, 2016 at 01:59:51PM -0800, Andrew Morton wrote:
> Got that, thanks.  Because the patch has significant information
> content I'd normally make it a standalone thing, but as it's destined
> for -stable I think I'll scrunch it into
> printk-do-cond_resched-between-lines-while-outputting-to-consoles.patch
> and merge the changelogs.

Sure thing.

> You didn't comment on Sergey's observations
> (https://lkml.org/lkml/2015/12/2/1192), but I'm believing this is
> a separate issue and that this patch is still good.

Missed that one somehow.  Will respond.

Thanks.

-- =

tejun

--===============2917410513939846764==--

