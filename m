Content-Type: multipart/mixed; boundary="===============0691628907908192126=="
MIME-Version: 1.0
From: Rhyland Klein <rklein@nvidia.com>
To: lkp@lists.01.org
Subject: Re: [drivers/of] ac78f9bdcf: BUG: KASAN: stack-out-of-bounds in unflatten_dt_nodes at addr ffff88000d8df7a0
Date: Fri, 20 May 2016 12:14:11 -0400
Message-ID: <09a31c6d-15b4-0602-6d63-b97683d56663@nvidia.com>
In-Reply-To: <573f3622.9X1xYG2s583sm2b+%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0691628907908192126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/20/2016 12:06 PM, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit ac78f9bdcf3836cafcd114a76a9473380a3faef5
> Author:     Rhyland Klein <rklein@nvidia.com>
> AuthorDate: Wed May 11 13:36:57 2016 -0400
> Commit:     Rob Herring <robh@kernel.org>
> CommitDate: Mon May 16 07:56:04 2016 -0500
> =


This seems to be using the older version of the patch. I see the new
version in linux-next 20160520.

-rhyland


-- =

nvpublic

--===============0691628907908192126==--

