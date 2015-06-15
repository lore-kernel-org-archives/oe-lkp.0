Content-Type: multipart/mixed; boundary="===============0648196832712234334=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [jbd2] 562bef4565e: kernel BUG at fs/jbd2/transaction.c:1329!
Date: Sun, 14 Jun 2015 21:46:12 -0400
Message-ID: <20150615014612.GB15793@thunk.org>
In-Reply-To: <1434331024.18774.102.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0648196832712234334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2015 at 09:17:04AM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://internal_merge_and_test_tree revert-562bef4565ef88e3c7206d5340263c8=
bb15bd87d-562bef4565ef88e3c7206d5340263c8bb15bd87d
> commit 562bef4565ef88e3c7206d5340263c8bb15bd87d ("jbd2: speedup jbd2_jour=
nal_dirty_metadata()")

Thanks, this commit has already been dropped from the ext4 git tree.

	     	    		     	     	      - Ted

--===============0648196832712234334==--

