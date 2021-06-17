Content-Type: multipart/mixed; boundary="===============4637268349070180865=="
MIME-Version: 1.0
From: Liu, Yujie <yujie.liu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/mremap] ecf8443e51: vm-scalability.throughput -29.4% regression
Date: Thu, 17 Jun 2021 02:38:29 +0000
Message-ID: <SJ0PR11MB5598DC21AC79E6D8D5F485FDFB0E9@SJ0PR11MB5598.namprd11.prod.outlook.com>
In-Reply-To: <a815a022-cf3e-fe4b-ee23-191523ed1980@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4637268349070180865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Sent: Tuesday, June 15, 2021 12:09 AM
> To: Sang, Oliver <oliver.sang@intel.com>
> Cc: lkp <lkp@intel.com>; LKML <linux-kernel@vger.kernel.org>; lkp(a)l=
ists.01.org; linux-mm(a)kvack.org; akpm(a)linux-foundation.org;
> mpe(a)ellerman.id.au; linuxppc-dev(a)lists.ozlabs.org; kaleshsingh(a)goog=
le.com; npiggin(a)gmail.com; joel(a)joelfernandes.org; Christophe
> Leroy <christophe.leroy@csgroup.eu>; Linus Torvalds <torvalds@linux-f=
oundation.org>; Kirill A . Shutemov <kirill@shutemov.name>
> Subject: [LKP] Re: [mm/mremap] ecf8443e51: vm-scalability.throughput -29.=
4% regression
> =

> On 6/14/21 8:25 PM, kernel test robot wrote:
> >
> >
> > Greeting,
> >
> > FYI, we noticed a -29.4% regression of vm-scalability.throughput due to=
 commit:
> >
> >
> > commit: ecf8443e51a862b261313c2319ab4e4aed9e6b7e ("[PATCH v7 02/11]
> > mm/mremap: Fix race between MOVE_PUD mremap and pageout")
> > url:
> > https://github.com/0day-ci/linux/commits/Aneesh-Kumar-K-V/Speedup-mrem
> > ap-on-ppc64/20210607-135424
> > base: https://git.kernel.org/cgit/linux/kernel/git/powerpc/linux.git
> > next
> >
> >
> =

> We dropped that approach and is now using https://lore.kernel.org/linux-m=
m/20210610083549.386085-1-aneesh.kumar(a)linux.ibm.com
> =

> =

> Instead of pud lock we are now using rmap lock with mremap.
> =

> Can you check with that series?

Hi Aneesh,

Could you please specify the base commit of the patch series? =


We have applied new patch series(rmap lock with mremap) on commit 027f55e87=
c30 (tty: hvc: udbg_hvc: retry putc on -EAGAIN), and it shows no regression=
 after patch.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                          =

compiler/cpufreq_governor/kconfig/nr_ssd/nr_task/rootfs/runtime/tbox_group/=
test/testcase/thp_defrag/thp_enabled/uco
de:                                                                        =
                                        =

  gcc-9/performance/x86_64-rhel-8.3/1/8/debian-10.4-x86_64-20200603.cgz/300=
/lkp-csl-2ap1/swap-w-seq-mt/vm-scalabili
ty/always/never/0x4003006                                                  =
                                        =

                                                                           =
                                        =

commit:                                                                    =
                                        =

  027f55e87c30 (tty: hvc: udbg_hvc: retry putc on -EAGAIN)        <---  pat=
ch's base commit      =

  ecf8443e51a8 (mm/mremap: Fix race between MOVE_PUD mremap and pageout)   =
   <---  first bad commit  =

  57da7477067d  (fixup)    <---  apply patch on 027f55e87c30
                                                                           =
                                        =

027f55e87c309427 ecf8443e51a862b261313c2319a 57da7477067dbe29247484eda0e   =
                                        =

---------------- --------------------------- ---------------------------   =
                                        =

         %stddev     %change         %stddev     %change         %stddev   =
                           =

             \          |                \          |                \     =
                           =

    371814 =C2=B1  3%     -29.1%     263582 =C2=B1  3%      -0.1%     37128=
6 =C2=B1  2%  vm-scalability.median       =



We also tried to apply patches on commit ecf8443e51a8 (mm/mremap: Fix race =
between MOVE_PUD mremap and pageout), and the regression increased to  -33.=
9%
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                          =

compiler/cpufreq_governor/kconfig/nr_ssd/nr_task/rootfs/runtime/tbox_group/=
test/testcase/thp_defrag/thp_enabled/uco
de:                                                                        =
                                        =

  gcc-9/performance/x86_64-rhel-8.3/1/8/debian-10.4-x86_64-20200603.cgz/300=
/lkp-csl-2ap1/swap-w-seq-mt/vm-scalabili
ty/always/never/0x4003006                                                  =
                                        =

                                                                           =
                                        =

commit:                                                                    =
                                        =

  5f80ee2fc08b (mm/mremap: Fix race between MOVE_PUD mremap and pageout)   =
   <--- first bad commit's parent                                          =
                   =

  ecf8443e51a8 (mm/mremap: Fix race between MOVE_PMD mremap and pageout)   =
 <--- first bad commit                                                     =
       =

  8ae369d45894 (fixup)      <--- apply patch on ecf8443e51a8
                                                                           =
                                        =

5f80ee2fc08b3613 ecf8443e51a862b261313c2319a 8ae369d4589492c7f7198cd742d   =
                                        =

---------------- --------------------------- ---------------------------   =
                                        =

          %stddev     %change         %stddev     %change         %stddev  =
                                         =

              \          |                \          |                \    =
                                         =

     373210           -29.4%     263582 =C2=B1  3%     -33.9%     246626 =
=C2=B1  2%  vm-scalability.median                    =


Thanks =


> -aneesh
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============4637268349070180865==--

