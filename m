Content-Type: multipart/mixed; boundary="===============5945242333234932195=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [block, blk] BUG: unable to handle kernel NULL pointer dereference at 0000000000000028
Date: Tue, 24 Jun 2014 18:11:48 -0400
Message-ID: <20140624221148.GJ14909@htj.dyndns.org>
In-Reply-To: <53A8F812.5050006@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5945242333234932195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2014 at 12:01:22PM +0800, Jet Chen wrote:
> Hi Tejun,
> =

> we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tj/misc.git review-mq-percp=
u_ref
> commit c924ec35e72ce0d6c289b858d323f7eb3f5076a5 ("block, blk-mq: draining=
 can't be skipped even if bypass_depth was non-zero")

Yeah, this is from trying to drain NULL root blkcg.  It's hit from
another path too and will soon be fixed.

Thanks!

-- =

tejun

--===============5945242333234932195==--

