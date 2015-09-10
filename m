Content-Type: multipart/mixed; boundary="===============6198148894666441676=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: : [ INFO: possible circular locking dependency detected ]
Date: Thu, 10 Sep 2015 10:06:28 +1000
Message-ID: <20150910100628.388d594d@canb.auug.org.au>
In-Reply-To: <20150909235756.GA21794@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6198148894666441676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

On Thu, 10 Sep 2015 07:57:56 +0800 Fengguang Wu <fengguang.wu@intel.com> =
wrote:
>
> The root cause is interesting. A recent change flipped a test,
> causing bisect failures (rather than success) to be emailed out.

Ooops.

> These bisect failures don't have $first_bad_commit, so the last
> checked linux-next HEAD is picked up. That means all errors are
> redirected to you. ;) =


nice :-(

Thanks for fixing it (you did fix it, right? :-))
-- =

Cheers,
Stephen Rothwell                    sfr(a)canb.auug.org.au

--===============6198148894666441676==--

