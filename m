Content-Type: multipart/mixed; boundary="===============0381313349608170611=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [parallel lookups machinery, part 2] 96352435af: kernel BUG at mm/slab.c:2599!
Date: Mon, 18 Apr 2016 15:12:47 +0800
Message-ID: <878u0bqtjk.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160418021504.GA25498@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0381313349608170611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Al Viro <viro@ZenIV.linux.org.uk> writes:

Hi, Viro,

> On Mon, Apr 18, 2016 at 10:08:37AM +0800, Huang, Ying wrote:
>
>> Could you provide a debug branch in your tree for that?
>
> Done - vfs.git#T1 and vfs.git#T2 resp.

The compare result between T1 and T2 is as follow:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/sleep/tbox_group/testcase:
  gcc-5/x86_64-allyesdebian/quantal-core-x86_64.cgz/1/vm-vp-quantal-x86_64/=
boot

commit: =

  3ab6378a68555a90a11360e2f2d63c9adb4e7101 (T1)
  e570d87b645a0bfd80e36df9753faf3598c9fce0 (T2)

3ab6378a68555a90 e570d87b645a0bfd80e36df975 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

         47:47        -100%            :3     dmesg.Kernel_panic-not_syncin=
g:Fatal_exception_in_interrupt
         47:47        -100%            :3     dmesg.RIP:kfree_debugcheck
         47:47        -100%            :3     dmesg.invalid_opcode:#[##]SMP
         47:47        -100%            :3     dmesg.kernel_BUG_at_mm/slab.c
          7:47         -15%            :3     kmsg.APIC_calibration_not_con=
sistent_with_PM-Timer:#ms_instead_of#ms
          1:47          -2%            :3     kmsg.kfree_debugcheck:out_of_=
range_ptr#a8h
          7:47         -15%            :3     kmsg.kfree_debugcheck:out_of_=
range_ptr#aah
         21:47         -45%            :3     kmsg.kfree_debugcheck:out_of_=
range_ptr#ach
          1:47          -2%            :3     kmsg.kfree_debugcheck:out_of_=
range_ptr#bah
          2:47          -4%            :3     kmsg.kfree_debugcheck:out_of_=
range_ptr#ch
          4:47          -9%            :3     kmsg.kfree_debugcheck:out_of_=
range_ptr#eh
         11:47         -23%            :3     kmsg.kfree_debugcheck:out_of_=
range_ptr#h

That is, there is same issue for T1, but no such issue for T2.

> How reproducible it is and how certain you are that it's not there on
> the parent commit?

The result is quite stable for tens tests for parents and the first bad
commit.

Best Regards,
Huang, Ying

--===============0381313349608170611==--

