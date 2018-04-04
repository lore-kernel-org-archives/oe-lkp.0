Content-Type: multipart/mixed; boundary="===============8495855233750914884=="
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [bisect done] e213635ee4 [ 10.294172] BUG: unable to handle kernel NULL pointer dereference at 0000000000000440
Date: Tue, 03 Apr 2018 19:47:30 -0700
Message-ID: <CAPcyv4iwf3qokHLQdMog0=V41sPuAAyTFU2mDnvZEYh=diHiwA@mail.gmail.com>
In-Reply-To: <20180404023202.6i2duhivdmjh4zhy@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8495855233750914884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 3, 2018 at 7:32 PM, kernel test robot
<fengguang.wu@intel.com> wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>
> commit e213635ee4633126c4482ead3c79231d124f4b03
> Author:     Dan Williams <dan.j.williams@intel.com>
> AuthorDate: Sat Oct 21 14:41:13 2017 -0700
> Commit:     Dan Williams <dan.j.williams@intel.com>
> CommitDate: Sun Apr 1 10:32:43 2018 -0700
>
>     mm, dax: enable filesystems to trigger dev_pagemap ->page_free callba=
cks

Yes, I lost the NULL check in fs_dax_release() in one of the reworks
to get the different config combinations to work. Fix on the way.

--===============8495855233750914884==--

