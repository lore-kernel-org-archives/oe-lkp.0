Content-Type: multipart/mixed; boundary="===============5927795489235539443=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [md] 8caa6068fa: kernel BUG at mm/slub.c:3656!
Date: Tue, 03 May 2016 09:29:10 +0200
Message-ID: <20160503072910.GC28039@dhcp22.suse.cz>
In-Reply-To: <87pot4gd5s.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5927795489235539443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 03-05-16 09:09:51, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> https://github.com/0day-ci/linux Michal-Hocko/tree-wide-get-rid-of-__GFP_=
REPEAT-for-order-0-allocations-part-I/20160428-212857
> commit 8caa6068fa57b7187daedbfa9507d5ba4f962a41 ("md: simplify free_param=
s for kmalloc vs vmalloc fallback")

This patch has been dropped from my series. Thanks for the test, anyway!
Mike has pointed out exactly this kind of crash [1]

[1] http://lkml.kernel.org/r/20160428153730.GA14570(a)redhat.com
-- =

Michal Hocko
SUSE Labs

--===============5927795489235539443==--

