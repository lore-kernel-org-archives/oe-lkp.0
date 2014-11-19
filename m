Content-Type: multipart/mixed; boundary="===============8781402266085698008=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [mm] kernel BUG at fs/xfs/xfs_aops.c:1069!
Date: Wed, 19 Nov 2014 15:48:10 +0000
Message-ID: <20141119154810.GJ2725@suse.de>
In-Reply-To: <20141119021710.GD3938@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8781402266085698008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2014 at 10:17:10AM +0800, Yuanhan Liu wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/mel/linux-balancenuma mm-nu=
ma-protnone-v1r7
> commit 5733e3f48a1f2c9ea4eb1eba38c06f65a48891a4 ("mm: Convert p[te|md]_mk=
nonnuma and remaining page table manipulations")
> =


Thanks. This is very similar to the bug that Sasha reported so I'm
hoping the fix for that will fix this one too. FWIW, I have pushed a
branch called mm-numa-protnone-v2r5 to the same tree and I'm currently
testing it as a release candidate.

-- =

Mel Gorman
SUSE Labs

--===============8781402266085698008==--

