Content-Type: multipart/mixed; boundary="===============8749374038546909678=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] [confidence: ] b3eab9f80b: kernel_BUG_at_fs/btrfs/raid56.c
Date: Wed, 15 Jun 2022 13:10:12 +0200
Message-ID: <20220615111012.GQ20633@twin.jikos.cz>
In-Reply-To: <11a59839-de31-a088-cf04-70a1a2cd07ee@gmx.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8749374038546909678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2022 at 03:12:08PM +0800, Qu Wenruo wrote:
> =

> =

> On 2022/6/15 14:29, kernel test robot wrote:
> >
> >
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-11):
> >
> > commit: b3eab9f80b60e3333e3ce3a7b7fbd323c71b00b1 ("btrfs: raid56: avoid=
 double for loop inside raid56_rmw_stripe()")
> > https://github.com/kdave/btrfs-devel.git dev/sb-own-page
> =

> That's already an older commit.

Also that's from my WIP branch from last week, that was based on your
raid patches at that time. The fixed v3 has been merged meanwhile and
new version of the superblock and page is not merged yet.
--===============8749374038546909678==--

