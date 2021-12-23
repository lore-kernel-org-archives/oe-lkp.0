Content-Type: multipart/mixed; boundary="===============8948714941045236306=="
MIME-Version: 1.0
From: Carel Si <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs] 7e84dfbf1b: BUG:unable_to_handle_page_fault_for_address
Date: Thu, 23 Dec 2021 15:27:49 +0800
Message-ID: <20211223072747.GA9125@linux.intel.com>
In-Reply-To: <YbKHoXui9NdAXICi@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8948714941045236306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Luis,

On Thu, Dec 09, 2021 at 02:48:01PM -0800, Luis Chamberlain wrote:
> On Thu, Dec 09, 2021 at 10:20:17PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with clang-14):
> > =

> > commit: 7e84dfbf1b7e4bef111ce5db72b4cc7421bd2a9d ("fs: move namespace s=
ysctls and declare fs base directory")
> > https://github.com/hying-caritas/linux.git mmotm-2021-11-29
> =

> Likewise, there were some issues with earlier incarnations of the
> patch series which were fixed later, can you try to reproduce with
> the latest linux-next?

We tested the latest linux-next and your patch in linux-next, no such issue=
, thanks.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/sleep/tbox_group/testcase:
  clang-14/i386-randconfig-a011-20211129/quantal-i386-core-20190426.cgz/1/v=
m-snb-i386/boot

commit: =

  7e84dfbf1b ("fs: move namespace sysctls and declare fs base directory")
  d0d3809a1c ("fs: move namespace sysctls and declare fs base directory") l=
inux-next/master
  next-20211222

7e84dfbf1b7e4bef d0d3809a1c1d3a93498c360ee16               next-20211222 =

---------------- --------------------------- --------------------------- =

       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
           |             |             |             |             |    =

          7:7         -100%            :7         -100%            :7     d=
mesg.BUG:unable_to_handle_page_fault_for_address

> =

>   Luis
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============8948714941045236306==--

