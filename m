Content-Type: multipart/mixed; boundary="===============6196484920475572413=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: : [ INFO: possible circular locking dependency detected ]
Date: Wed, 09 Sep 2015 23:13:31 +1000
Message-ID: <20150909231331.75332a26@canb.auug.org.au>
In-Reply-To: <55f028ec.9d64QMHfN2MvbcW6%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6196484920475572413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 09 Sep 2015 20:41:16 +0800 kernel test robot <fengguang.wu@intel.=
com> wrote:
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://internal_merge_and_test_tree devel-hourly-2015090915
> =

> commit 72c9d8043fdc87832802de0b7a7129d6fc4c4c70
> Author:     Stephen Rothwell <sfr@canb.auug.org.au>
> AuthorDate: Wed Sep 9 13:23:18 2015 +1000
> Commit:     Stephen Rothwell <sfr@canb.auug.org.au>
> CommitDate: Wed Sep 9 13:23:18 2015 +1000
> =

>     Add linux-next specific files for 20150909
>     =

>     Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

I have had a few notifications lately claiming that the "first bad
commit" is these top of tree commits.  This is basically not possible
as those commits only commit files that are documentation of the
linux-next process.  I suspect something has gone wrong with the
bisections process ...

-- =

Cheers,
Stephen Rothwell                    sfr(a)canb.auug.org.au

--===============6196484920475572413==--

