Content-Type: multipart/mixed; boundary="===============2198146830298527131=="
MIME-Version: 1.0
From: Gao Xiang <gaoxiang25@huawei.com>
To: lkp@lists.01.org
Subject: Re: 29b848451d ("<linux/taggedptr.h>: Introduce tagged pointer"): WARNING: lock held when returning to user space!
Date: Fri, 29 Jun 2018 11:14:08 +0800
Message-ID: <e52e0ca7-38a1-8e97-b8e2-80223a9a2f1c@huawei.com>
In-Reply-To: <5b34d1ad.WIuhuOip1TcwTENt%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2198146830298527131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 2018/6/28 20:16, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux/commits/Gao-Xiang/linux-taggedptr-h-Intr=
oduce-tagged-pointer/20180628-175554
> =

> commit 29b848451ddc66bd7f72780d70d7022f0eed9931
> Author:     Gao Xiang <gaoxiang25@huawei.com>
> AuthorDate: Thu Jun 28 17:06:29 2018 +0800
> Commit:     0day robot <lkp@intel.com>
> CommitDate: Thu Jun 28 17:55:56 2018 +0800
> =

>     <linux/taggedptr.h>: Introduce tagged pointer
>     =

>     Currently kernel has scattered tagged pointer usages hacked
>     by hand in plain code, without a unique and portable functionset
>     to highlight the tagged pointer itself and wrap these hacked code
>     in order to clean up all over meaningless magic masks.
>     =

>     Therefore, this patch introduces simple generic methods to fold
>     tags into a pointer integer. It currently reuses the last 2 bits
>     of the pointer for tags, which are safely for all modern platforms.
>     =

>     In addition, it will also be used for the upcoming EROFS filesystem,
>     which heavily uses tagged pointer approach for high performance
>     and reducing extra memory allocation.
>     =

>     Refer to:
>     https://en.wikipedia.org/wiki/Tagged_pointer
>     =

>     To: Alexander Viro <viro@zeniv.linux.org.uk>
>     Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>     Cc: Kate Stewart <kstewart@linuxfoundation.org>
>     Cc: Philippe Ombredanne <pombredanne@nexb.com>
>     Cc: Thomas Gleixner <tglx@linutronix.de>
>     Cc: Chao Yu <yuchao0@huawei.com>
>     Cc: Miao Xie <miaoxie@huawei.com>
>     Cc: linux-fsdevel(a)vger.kernel.org
>     Cc: linux-erofs(a)lists.ozlabs.org
>     Cc: linux-kernel(a)vger.kernel.org
>     Signed-off-by: Gao Xiang <gaoxiang25@huawei.com>

Thanks for quickly pointing out. :)

The v1 patch is broken accidently by mistake, I already fixed this issue in=
 v2, v3 patch, please drop this version patch.

Please refer to:
v2:
https://marc.info/?l=3Dlinux-fsdevel&m=3D153019547331833&w=3D2

v3:
https://marc.info/?l=3Dlinux-fsdevel&m=3D153019818032728&w=3D2


Thanks,
Gao Xiang

--===============2198146830298527131==--

