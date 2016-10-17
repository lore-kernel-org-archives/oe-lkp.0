Content-Type: multipart/mixed; boundary="===============5741577871532305874=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [posix_acl] 073931017b: xfstests.generic.314.fail
Date: Mon, 17 Oct 2016 10:21:36 +0200
Message-ID: <20161017082136.GC3359@quack2.suse.cz>
In-Reply-To: <20161017021122.GD22605@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5741577871532305874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 17-10-16 10:11:22, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 073931017b49d9458aa351605b43a7e34598caef ("posix_acl: Clear SGID b=
it when setting file permissions")
> =

> in testcase: xfstests
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: ext4
> 	test: generic-quick2
> =

> =

> xfstests is a regression test suite for xfs and other files ystems.
 =

<snip>

> Failures: generic/092 generic/255 generic/314 generic/316
> Failed 4 of 76 tests

The changes in generic/092, generic/255, generic/316 look unrelated. Not
sure how 0-day ended up blaming that commit (furthermore they don't
reproduce for me locally). The change in generic/314 is known and
deliberate. xfstests have been fixed up already AFAIK.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============5741577871532305874==--

