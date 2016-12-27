Content-Type: multipart/mixed; boundary="===============6749450595473515482=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [xfs] adec70d405 kernel BUG at fs/xfs/kmem.h:48!
Date: Tue, 27 Dec 2016 10:15:57 +0100
Message-ID: <20161227091557.GB1308@dhcp22.suse.cz>
In-Reply-To: <20161227011413.s2ldvwze5rjvsfwf@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6749450595473515482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 27-12-16 09:14:13, Wu Fengguang wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux Michal-Hocko/scope-GFP_NOFS-api/20161215=
-230237
> =

> commit adec70d40578b3a12dd16a67689975c8dac7f15a
> Author:     Michal Hocko <mhocko@suse.com>
> AuthorDate: Thu Dec 15 15:07:08 2016 +0100
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Thu Dec 15 23:02:42 2016 +0800
> =

>      xfs: introduce and use KM_NOLOCKDEP to silence reclaim lockdep false=
 positives
>      =

>      Now that the page allocator offers __GFP_NOLOCKDEP let's introduce
>      KM_NOLOCKDEP alias for the xfs allocation APIs. While we are at it
>      also change KM_NOFS users introduced by b17cb364dbbb ("xfs: fix miss=
ing
>      KM_NOFS tags to keep lockdep happy") and use the new flag for them
>      instead. There is really no reason to make these allocations contexts
>      weaker just because of the lockdep which even might not be enabled
>      in most cases.
>      =

>      Signed-off-by: Michal Hocko <mhocko@suse.com>

The follow up fix is
http://lkml.kernel.org/r/20161216154041.GA7645(a)dhcp22.suse.cz
-- =

Michal Hocko
SUSE Labs

--===============6749450595473515482==--

