Content-Type: multipart/mixed; boundary="===============9218985994971525584=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [fs] 36e2c7421f: xfstests.generic.095.fail
Date: Mon, 12 Sep 2022 13:06:46 +0200
Message-ID: <20220912110646.bn4q2vh5jxii7zrx@quack3>
In-Reply-To: <20220909144406.GA10618@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============9218985994971525584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 09-09-22 16:44:06, Christoph Hellwig wrote:
> On Thu, Sep 08, 2022 at 03:01:57PM +0800, kernel test robot wrote:
> > Hi Christoph,
> > =

> > According to the commit message of below patch, we understand that it
> > removes splice support for some device drivers, but we don't have enough
> > knowledge to connect the code change with testcase result. We send this
> > report for your reference, please kindly check if it is an expected
> > result. Thanks.
> =

> This might be as simple wiring up iter_file_splice_write, but I don't
> really have a good way to test udf, so adding the maintainer.

Indeed. Thanks for notifying me. Just adding:

.splice_write           =3D iter_file_splice_write,

to udf_file_operations fixes the problem for me and generic/095 passes
fine. I've queued the fix to my tree.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============9218985994971525584==--

