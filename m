Content-Type: multipart/mixed; boundary="===============0700281476570203403=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: 62e5d8180c ("mm/lru: change the lru_lock iff page's lruvec is .."): BUG: sleeping function called from invalid context at include/linux/pagemap.h:468
Date: Sat, 21 Sep 2019 17:20:47 +0800
Message-ID: <20190921092047.GD2355@intel.com>
In-Reply-To: <94145bb6-14bd-1a2c-2385-26890f8352be@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0700281476570203403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2019 at 11:49:35PM +0800, Alex Shi wrote:
> =

> =

> =E5=9C=A8 2019/9/20 =E4=B8=8A=E5=8D=887:10, kernel test robot =E5=86=99=
=E9=81=93:
> > =

> > f8efbd33e3  mm/lru: replace pgdat lru_lock with lruvec lock
> > 62e5d8180c  mm/lru: change the lru_lock iff page's lruvec is different
> > 285d41f504  mm/lru: fix the comments of lru_lock
> > +----------------------------------------------------------------------=
--------+------------+------------+------------+
> > |                                                                      =
        | f8efbd33e3 | 62e5d8180c | 285d41f504 |
> > +----------------------------------------------------------------------=
--------+------------+------------+------------+
> > | boot_successes                                                       =
        | 46         | 0          | 0          |
> > | boot_failures                                                        =
        | 1          | 18         | 17         |
> > | BUG:unable_to_handle_page_fault_for_address                          =
        | 1          |            |            |
> =

> Thanks a lot Philip!
> =

> Do you still have the above ops message of f8efbd33e3, which is hidden de=
eper and more valuable!
Hi Alex, you are welcome, pls allow a few days, we will check
and provide information to you next Monday. +Rong to help here.

> =

> Thanks
> Alex

--===============0700281476570203403==--

