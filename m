Content-Type: multipart/mixed; boundary="===============3521718557854406061=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [ksm] 40e318e509: ltp.ksm01.fail
Date: Mon, 25 Jan 2016 15:54:26 +0100
Message-ID: <20160125145426.GB12228@redhat.com>
In-Reply-To: <87io2ibbrh.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3521718557854406061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jan 25, 2016 at 11:04:18AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 40e318e509d2c9f3cdb00ef32d2c14b9868af16b ("ksm: introduce ksm_max_=
page_sharing per page deduplication limit")
> =

> We found LKP KSM test case failed for your patch.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/kconfig/rootfs/tbox_group/test/testcase:
>   gcc-5/x86_64-nfsroot/debian-x86_64-2015-02-07.cgz/vm-lkp-wsx03-4G/mm_fu=
nctional_positive/otc_kernel_qa-ts_ltp_ddt
> =

> commit: =

>   77505a33e539477f1fbe5e6136df5b265f39cccf
>   40e318e509d2c9f3cdb00ef32d2c14b9868af16b
> =

> 77505a33e539477f 40e318e509d2c9f3cdb00ef32d =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :4          100%           4:4     otc_kernel_qa-ts_ltp_ddt.ks=
m01.fail
>            :4          100%           4:4     otc_kernel_qa-ts_ltp_ddt.ks=
m01_1.fail

In this case it's one rare case of false positive. The change in the
merging levels is a "feature" not a "bug".

LTP validation math on ksm sysfs levels shall be updated to account
for the runtime value of /sys/kernel/mm/ksm/max_page_sharing which in
turn affects pages_sharing/pages_shared. In fact you could add
validation for the new fields like stable_node_dups and
stable_node_chains on top of the existing verifications on pages_shar*.

For now you should re-run the test after:

    echo 2 >/sys/kernel/mm/ksm/run
    echo 10000000 > /sys/kernel/mm/ksm/max_page_sharing
    echo 1 >/sys/kernel/mm/ksm/run

And then LTP will pass as usual.

Thanks for the greatly valuable regression testing work,
Andrea

--===============3521718557854406061==--

