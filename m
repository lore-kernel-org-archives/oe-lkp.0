Content-Type: multipart/mixed; boundary="===============1308792061127793507=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: b179f0826c BUG: kernel hang in boot stage
Date: Thu, 01 Nov 2018 14:54:04 +1100
Message-ID: <20181101145404.396c0973@canb.auug.org.au>
In-Reply-To: <20181101011307.GW24195@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1308792061127793507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 1 Nov 2018 09:13:07 +0800 kernel test robot <rong.a.chen@intel.co=
m> wrote:
>
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit b179f0826c6a13563c5ce0554c6da6748a1fa699
> Author:     Stephen Rothwell <sfr@canb.auug.org.au>
> AuthorDate: Mon Oct 29 16:55:21 2018 +1100
> Commit:     Stephen Rothwell <sfr@canb.auug.org.au>
> CommitDate: Mon Oct 29 16:55:21 2018 +1100
> =

>     Add linux-next specific files for 20181029
>     =

>     Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> =

> a3bbfc79c4  Merge branch 'akpm/master'
> b179f0826c  Add linux-next specific files for 20181029
> +------------------------------------------------+------------+----------=
-----+
> |                                                | a3bbfc79c4 | next-2018=
1029 |
> +------------------------------------------------+------------+----------=
-----+
> | boot_successes                                 | 33         | 0        =
     |
> | boot_failures                                  | 2          | 30       =
     |
> | BUG:kernel_hang_in_boot_stage                  | 1          | 30       =
     |
> | IP-Config:Auto-configuration_of_network_failed | 1          |          =
     |
> +------------------------------------------------+------------+----------=
-----+

That is really hard to believe given that the commit above only adds
documentation to the tree :-)

$ git log --stat -1 next-20181029
commit b179f0826c6a13563c5ce0554c6da6748a1fa699 (tag: next-20181029)
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Mon Oct 29 16:55:21 2018 +1100

    Add linux-next specific files for 20181029
    =

    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

 Next/SHA1s            |   292 +
 Next/Trees            |   294 +
 Next/merge.log        | 14253 ++++++++++++++++++++++++++++++++++++++++++++=
++++
 Next/quilt-import.log |     2 +
 localversion-next     |     1 +
 5 files changed, 14842 insertions(+)

-- =

Cheers,
Stephen Rothwell

--===============1308792061127793507==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVOSUM5NmdpWjgx
dFdkTGdLQVZCQzgwbFgwR3dGQWx2YWVOd0FDZ2tRQVZCQzgwbFgKMEd4T0xnZ0FucGs2SHh2TElZ
S2UvQ1pMdzkvb09xbVUvaXhmeWpqblNjQVp3UDEzNTNWVFNhVUNsd3RUUTdncwoySGlXQlIrN0lL
cW1qa0ZyemRyT01qOTk5THZSZHNtc3AxRGE1c3I3ZmRTbWM2eFlCaW5Db3J3a3dkM2pSNFJBCnNN
c212VEpTbjFtZ3diZTdFTkRxejhKTVoyd3kybWlmdDJENUJMcVdTZlMxT29nSW5BcXpaVlU2RVYx
bnV6WE8KbmF2TytEMDdHSVhhbnBoVHc1Y3QzZS9YTFlVL0lFTXZEZGdlL0FwSjlwQ2xLT1BPODBr
SStCTG4ybmdlWmFlUgpTczVFeHM5TUp2Rmg0LzB1elQrSFZvekpMTlRsREJyZmF4QjUzUXZDUWFu
ZkNUSWgzQXg4MWlzREJXdVNJK09kCmZhZEZ4d1NUaUZQWDNHTUo4eVFRSmh1U0lrZHNUUT09Cj1X
bXkxCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1308792061127793507==--

