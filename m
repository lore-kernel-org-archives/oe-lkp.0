Content-Type: multipart/mixed; boundary="===============5828454078241204861=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [ext4] 05c2c00f37: aim7.jobs-per-min -11.8% regression
Date: Fri, 03 Sep 2021 08:32:21 -0400
Message-ID: <YTIV1SozOGwT/DQw@mit.edu>
In-Reply-To: <8ac28fce-0cfb-cc4d-1a3d-2f104ff46767@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5828454078241204861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 01:28:25PM +0800, Xing Zhengjun wrote:
> Hi Jan,
> =

>      Do you have time to look at this? I re-test it in v5.13 and v5.14, t=
he
> regression still existed. Thanks.

> > So as we chatted on today's call probably the best option is to leave t=
he
> > code as is for now and instead work on moving away from orphan list
> > altogether. I'll revive my patches to do that.

The orphan_file feature has landed in for the 5.15 merge window.  When
enabled, it provides multiple blocks to store the set of orphaned
inodes, which provides parallelism for parallel truncate and unlink
operations.

It requires a development version of e2fsprogs to use, and so the
zero-day bot won't be able to test it for a little while.

Cheers,

						- Ted


--===============5828454078241204861==--

